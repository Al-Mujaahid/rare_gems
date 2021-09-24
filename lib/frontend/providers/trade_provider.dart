
import 'dart:convert';

import 'package:candlesticks/candlesticks.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rare_gem/frontend/providers/base_provider.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class TradeProvider extends BaseProvider {

  List<Candle> candles = [];
  WebSocketChannel? channel;

  String interval = "1m";
  String symbol = 'XAU';

  TradeProvider({String symbol = 'XAU'}) {
    initialize(symbol: symbol);
  }

  Future<List<Candle>> fetchCandles({required String symb, required String interval}) async {
    final uri = Uri.parse("https://api.binance.com/api/v3/klines?symbol=$symb&interval=$interval&limit=1000");
    final res = await Dio().get(uri.toString());
    print(res.realUri.toString());
    return ((res.data) as List<dynamic>)
        .map((e) => Candle.fromJson(e))
        .toList()
        .reversed
        .toList();
  }

  void binanceFetch(String interval, String symb) {
    fetchCandles(symb: symb, interval: interval).then((value) {
        print('Populated candels: $value');
        interval = interval;
        candles = value;
      },
    );
    if (channel != null) channel!.sink.close();
    channel = WebSocketChannel.connect(Uri.parse('wss://stream.binance.com:9443/ws'));
    channel!.sink.add(
      jsonEncode(
        {
          "method": "SUBSCRIBE",
          "params": ["${'BUSD'+symb.toLowerCase()}@kline_" + interval],
          "id": 1
        },
      ),
    );
    notifyListeners();
  }

  void initialize({String symbol = 'XAU'}) async {
    binanceFetch("1m", symbol);
  }

  void updateCandlesFromSnapshot(AsyncSnapshot<Object?> snapshot) {
    if (snapshot.data != null) {
      final data = jsonDecode(snapshot.data as String) as Map<String, dynamic>;
      if (data.containsKey("k") == true &&
          candles[0].date.millisecondsSinceEpoch == data["k"]["t"]) {
        candles[0] = Candle(
            date: candles[0].date,
            high: double.parse(data["k"]["h"]),
            low: double.parse(data["k"]["l"]),
            open: double.parse(data["k"]["o"]),
            close: double.parse(data["k"]["c"]),
            volume: double.parse(data["k"]["v"]));
      } else if (data.containsKey("k") == true &&
          data["k"]["t"] - candles[0].date.millisecondsSinceEpoch ==
              candles[0].date.millisecondsSinceEpoch -
                  candles[1].date.millisecondsSinceEpoch) {
        candles.insert(
            0,
            Candle(
                date: DateTime.fromMillisecondsSinceEpoch(data["k"]["t"]),
                high: double.parse(data["k"]["h"]),
                low: double.parse(data["k"]["l"]),
                open: double.parse(data["k"]["o"]),
                close: double.parse(data["k"]["c"]),
                volume: double.parse(data["k"]["v"])));
      }
    }
  }
}