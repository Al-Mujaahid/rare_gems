import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rare_gem/frontend/providers/dashboard_provider.dart';
import 'package:rare_gem/frontend/providers/wallet/balance_provider.dart';
import 'package:rare_gem/frontend/widgets/button.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/utils/constants/constants.dart';
import 'package:rare_gem/utils/constants/routes.dart';
import 'package:rare_gem/utils/styles/colors.dart';
import 'package:rare_gem/utils/styles/text.dart';

class MainWalletBalance extends StatelessWidget {
  const MainWalletBalance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.fromLTRB(16, 129, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Main Wallet", style: interTextStyle.copyWith(
              color: Colors.white, fontSize: 15
          )),
          ColumnSpace(3),
          Consumer<BalanceProvider>(
            builder: (context, value, child) {
              return InkWell(
                onTap: () => value.initialize(),
                child: Text("$CURRENCY_SYMBOL ${moneyFormat.format(value.nairaBalance)}", style: sfProTextStyle.copyWith(
                    color: Colors.white, fontSize: 40, fontWeight: FontWeight.w700
                )),
              );
            },
          ),
          ColumnSpace(24),
          Row(
            children: [
              RareGemPrimarySmallButton(
                child: Text("Add Funds", style: interTextStyle.copyWith(
                    color: Colors.white, fontSize: 15
                ),), onClick: () => Navigator.of(context).pushNamed(ADD_FUND_SELECT_PAYMENT_METHOD_ROUTE),
              ),
              RowSpace(16),
              InkWell(
                onTap: () => Navigator.of(context).pushNamed(WITHDRAW_AMOUNT_WITHDRAW_ROUTE),
                child: RareGemOutlineSmallButton(
                    child: Text('Withdraw', style: interTextStyle.copyWith(
                        fontWeight: FontWeight.w600, fontSize: 15, color: Colors.white
                    ),), color: Colors.white
                ),
              )
            ],
          ),
          ColumnSpace(20),
          InkWell(
            onTap: () => Navigator.of(context).pushNamed(TRANSACTION_HISTORY_ROUTE, arguments: 'main'),
            child: Row(
              children: [
                Text('View transaction history', style: interTextStyle.copyWith(
                    color: Colors.white, fontSize: 15
                ),),
                RowSpace(12),
                Icon(Icons.arrow_right, color: Colors.white,)
              ],
            ),
          ),

        ],
      ),
    );
  }
}
