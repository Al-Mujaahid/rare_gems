import 'package:flutter/material.dart';
import 'package:rare_gem/frontend/widgets/bank_account_payment_method.dart';
import 'package:rare_gem/frontend/widgets/button.dart';
import 'package:rare_gem/frontend/widgets/payment_method.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/utils/constants/routes.dart';
import 'package:rare_gem/utils/styles/text.dart';

class AddFundSelectPaymentMethodScreen extends StatelessWidget {
  const AddFundSelectPaymentMethodScreen({Key? key}) : super(key: key);

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
            Text("Fund your account", style: sfProTextStyle.copyWith(
              fontWeight: FontWeight.w700, fontSize: 34,
            ),),
            ColumnSpace(16),
            Text("Fund your account by transfering money into the account number below or use the alternative channels.", style: subtitleStyle,),
            ColumnSpace(41),
            BankPaymentDetail(),
            ColumnSpace(20),
            PaymentMethods(),
            ColumnSpace(40),
            RareGemPrimaryButton(
              child: Text("Next", style: subtitleStyle.copyWith(
                  color: Colors.white, fontWeight: FontWeight.w600
              ),),
              onClick: () => Navigator.of(context).pushNamed(ADD_FUND_AMOUNT_TO_FUND_ROUTE),
            )
          ],
        ),
      ),
    );
  }
}
