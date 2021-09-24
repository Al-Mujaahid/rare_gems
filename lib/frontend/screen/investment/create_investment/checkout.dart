import 'package:flutter/material.dart';
import 'package:rare_gem/frontend/widgets/bank_account_payment_method.dart';
import 'package:rare_gem/frontend/widgets/button.dart';
import 'package:rare_gem/frontend/widgets/payment_method.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/utils/constants/routes.dart';
import 'package:rare_gem/utils/styles/colors.dart';
import 'package:rare_gem/utils/styles/text.dart';

class CheckoutInvestmentScreen extends StatelessWidget {
  const CheckoutInvestmentScreen({Key? key}) : super(key: key);

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
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(Icons.arrow_back_ios, color: Colors.black, size: 24,),
                ),
                Expanded(
                  child: Center(
                    child: Text('New Investment', style: subtitleStyle.copyWith(
                      fontWeight: FontWeight.w600, color: Colors.black
                    ),),
                  ),
                )
              ],
            ),
            ColumnSpace(16),
            Text("Select payment method", style: sfProTextStyle.copyWith(
              fontSize: 34, fontWeight: FontWeight.w700
            ),),
            ColumnSpace(27),
            BankPaymentDetail(),
            ColumnSpace(20),
            PaymentMethods(),
            ColumnSpace(96),
            RareGemPrimaryButton(
              child: Text("Complete Investment", style: subtitleStyle.copyWith(
                  color: Colors.white, fontWeight: FontWeight.w600
              ),),
              onClick: () => Navigator.of(context).pushNamed(CHECKOUT_INVESTMENT_ROUTE),
            )
          ],
        ),
      ),
    );
  }
}
