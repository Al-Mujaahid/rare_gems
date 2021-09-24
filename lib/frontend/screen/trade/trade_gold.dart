import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rare_gem/frontend/providers/trade_provider.dart';

class TradeGoldScreen extends StatelessWidget {
  TradeGoldScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TradeProvider(symbol: 'BTCUSDT'),
      child: Consumer<TradeProvider>(
        builder: (context, value, child) {
          return AspectRatio(
            aspectRatio: 1.2,
            child: StreamBuilder(
              stream: value.channel == null ? null : value.channel!.stream,
              builder: (context, snapshot) {
                value.updateCandlesFromSnapshot(snapshot);
                return Candlesticks(
                  onIntervalChange: (String val) async {
                    value.binanceFetch(val, 'BTCUSDT');
                  },
                  candles: value.candles,
                  interval: value.interval,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
