import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rare_gem/frontend/screen/trade/trade_gold.dart';
import 'package:rare_gem/frontend/screen/trade/trade_silver.dart';
import 'package:rare_gem/frontend/widgets/button.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/utils/styles/colors.dart';
import 'package:rare_gem/utils/styles/text.dart';

class TradeScreen extends StatefulWidget {
  TradeScreen({Key? key}) : super(key: key);

  @override
  _TradeScreenState createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen> {
  String tradeToShow = 'gold';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ColumnSpace(56),
            Text('Trade', style: sfProTextStyle.copyWith(
              fontWeight: FontWeight.w700, fontSize: 34
            ),),
            ColumnSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Visibility(
                  visible: tradeToShow == 'gold',
                  child: RareGemPrimarySmallButton(
                    child: Text('Trade Gold', style: interTextStyle.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15
                    ),), onClick: () {

                  },),
                  replacement: RareGemPrimaryOutlineSmallButton(
                    child: Text('Trade Gold', style: interTextStyle.copyWith(
                        color: primaryColor, fontWeight: FontWeight.w600, fontSize: 15
                    )), onClick: () {
                    setState(() {
                      tradeToShow = 'gold';
                    });
                  },),
                ),

                RowSpace(16),
                Visibility(
                  visible: tradeToShow == 'silver',
                  child: RareGemPrimarySmallButton(
                    child: Text('Trade Silver', style: interTextStyle.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15
                    ),), onClick: () {

                  },),
                  replacement: RareGemPrimaryOutlineSmallButton(
                    child: Text('Trade Silver', style: interTextStyle.copyWith(
                        color: primaryColor, fontWeight: FontWeight.w600, fontSize: 15
                    )), onClick: () {
                    setState(() {
                      tradeToShow = 'silver';
                    });
                  },),
                ),
              ],
            ),
            ColumnSpace(30),
            Expanded(
              child: tradeToShow == 'gold' ? TradeGoldScreen() : TradeSilverScreen(),
            )
          ],
        ),
      ),
    );
  }
}
