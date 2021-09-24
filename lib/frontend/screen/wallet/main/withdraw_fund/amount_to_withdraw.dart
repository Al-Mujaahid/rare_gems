import 'package:flutter/material.dart';
import 'package:rare_gem/frontend/widgets/button.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/utils/constants/constants.dart';
import 'package:rare_gem/utils/constants/routes.dart';
import 'package:rare_gem/utils/styles/input.dart';
import 'package:rare_gem/utils/styles/text.dart';

class WithdrawAmountToWithdraw extends StatelessWidget {
  const WithdrawAmountToWithdraw({Key? key}) : super(key: key);

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
                  child: Icon(Icons.arrow_back_ios, color: Colors.black, size: 24,),
                ),
              ],
            ),
            ColumnSpace(17),
            Text("Amount to withdraw", style: sfProTextStyle.copyWith(
              fontWeight: FontWeight.w700, fontSize: 34,
            ),),
            ColumnSpace(40),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Amount to withdraw in $CURRENCY_SYMBOL', style: subtitleStyle, textAlign: TextAlign.left,),
                  TextFormField(
                    onChanged: (String text) => print(text),
                    decoration: underlineInputDecoration(filled: false, hintText: 'Enter amount to withdraw in $CURRENCY_SYMBOL'),
                  ),
                ],
              ),
            ),
            ColumnSpace(40),
            RareGemPrimaryButton(
              child: Text("Next", style: subtitleStyle.copyWith(
                  color: Colors.white, fontWeight: FontWeight.w600
              ),),
              onClick: () => Navigator.of(context).pushNamed(WITHDRAW_SUMMARY_ROUTE),
            ),
            ColumnSpace(40),

          ],
        ),
      ),
    );
  }
}
