import 'package:flutter/material.dart';
import 'package:rare_gem/frontend/widgets/button.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/utils/constants/constants.dart';
import 'package:rare_gem/utils/styles/text.dart';

class AddFundSummary extends StatelessWidget {
  const AddFundSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ColumnSpace(55),
            Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context) ,
                  child: Icon(Icons.close, color: Colors.black, size: 24,),
                ),
                Expanded(
                  child: Center(
                    child: Text('Complete Purchase', style: subtitleStyle.copyWith(
                        fontWeight: FontWeight.w600, color: Colors.black
                    ),),
                  ),
                )
              ],
            ),
            ColumnSpace(33),
            Text("Transaction overview", style: sfProTextStyle.copyWith(
              fontWeight: FontWeight.w700, fontSize: 34,
            ),),
            ColumnSpace(47),
            Text("Bank Transfer payment method", style: interTextStyle.copyWith(
              fontWeight: FontWeight.w600, fontSize: 17,
            ),),
            ColumnSpace(21),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  border: Border.all(color: Color(0xFFD8D8D8))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Amount", style: subtitleStyle.copyWith(
                    fontSize: 13
                  ),),
                  ColumnSpace(2),
                  Text("$CURRENCY_SYMBOL ${moneyFormat.format(15000)}", style: interTextStyle.copyWith(
                      fontSize: 15, fontWeight: FontWeight.w500
                  ),),
                  // Transaction fee
                  ColumnSpace(9),
                  Text("Transaction fee", style: subtitleStyle.copyWith(
                      fontSize: 13
                  ),),
                  ColumnSpace(2),
                  Text("$CURRENCY_SYMBOL ${moneyFormat.format(0)}", style: interTextStyle.copyWith(
                      fontSize: 15, fontWeight: FontWeight.w500
                  ),),
                  // Amount to pay
                  ColumnSpace(9),
                  Text("Amount to pay", style: subtitleStyle.copyWith(
                      fontSize: 13
                  ),),
                  ColumnSpace(2),
                  Text("$CURRENCY_SYMBOL ${moneyFormat.format(15000)}", style: interTextStyle.copyWith(
                      fontSize: 15, fontWeight: FontWeight.w500
                  ),),
                ],
              ),
            ),
            Expanded(
              child: Container(),
            ),
            RareGemPrimaryButton(
              child: Text("Fund your Account", style: subtitleStyle.copyWith(
                  color: Colors.white, fontWeight: FontWeight.w600
              ),),
              onClick: () => Navigator.of(context).pushNamed(''),
            ),
            ColumnSpace(34),
          ],
        ),
      ),
    );
  }
}
