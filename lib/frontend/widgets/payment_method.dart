import 'package:flutter/material.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/utils/constants/routes.dart';
import 'package:rare_gem/utils/styles/colors.dart';
import 'package:rare_gem/utils/styles/text.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => Navigator.of(context).pushNamed(VIEW_INVESTMENT_ROUTE),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  border: Border.all(color: Color(0xFFD8D8D8))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xFFEFEFF4),
                    child: Icon(Icons.account_balance_wallet_outlined, size: 40, color: Color(0xFFC8C7CC),),
                  ),
                  RowSpace(10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Wallet", style: interTextStyle.copyWith(
                          fontWeight: FontWeight.w600,
                        ),),
                        ColumnSpace(2),
                        Text("Transfer from eWallet account", style: subtitleStyle.copyWith(
                            fontSize: 13
                        )),
                      ],
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10000)),
                        border: Border.all(
                            color: Color(0xFFD8D8D8)
                        )
                    ),
                    width: 30, height: 30,
                  )
                ],
              ),
            ),
          ),
          ColumnSpace(10),
          InkWell(
            onTap: () => Navigator.of(context).pushNamed(VIEW_INVESTMENT_ROUTE),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  border: Border.all(color: Color(0xFFD8D8D8))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xFFEFEFF4),
                    child: Icon(Icons.account_balance, size: 40, color: Color(0xFFC8C7CC),),
                  ),
                  RowSpace(10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Bank Transfer", style: interTextStyle.copyWith(
                          fontWeight: FontWeight.w600,
                        ),),
                        ColumnSpace(2),
                        Text("Deposit or local bank transfer", style: subtitleStyle.copyWith(
                            fontSize: 13
                        )),
                      ],
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10000)),
                        border: Border.all(
                            color: Color(0xFFD8D8D8)
                        )
                    ),
                    width: 30, height: 30,
                  )
                ],
              ),
            ),
          ),
          ColumnSpace(10),
          InkWell(
            onTap: () => Navigator.of(context).pushNamed(VIEW_INVESTMENT_ROUTE),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  border: Border.all(color: Color(0xFFD8D8D8))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xFFEFEFF4),
                    child: Icon(Icons.credit_card, size: 40, color: Color(0xFFA644FF),),
                  ),
                  RowSpace(10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Card", style: interTextStyle.copyWith(
                          fontWeight: FontWeight.w600,
                        ),),
                        ColumnSpace(2),
                        Text("Pay directly from card", style: subtitleStyle.copyWith(
                            fontSize: 13
                        )),
                      ],
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10000)),
                      border: Border.all(
                        color: Color(0xFFD8D8D8)
                      ),
                      color: successColor
                    ),
                    width: 30, height: 30,
                    child: Icon(Icons.check, color: Colors.white,),
                  )
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
