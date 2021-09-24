import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rare_gem/frontend/providers/wallet/balance_provider.dart';
import 'package:rare_gem/frontend/providers/wallet/rate_provider.dart';
import 'package:rare_gem/frontend/widgets/button.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/utils/constants/constants.dart';
import 'package:rare_gem/utils/constants/routes.dart';
import 'package:rare_gem/utils/styles/colors.dart';
import 'package:rare_gem/utils/styles/text.dart';

class SilverWalletBalance extends StatelessWidget {
  const SilverWalletBalance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.fromLTRB(16, 129, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Silver Wallet", style: interTextStyle.copyWith(
              color: Colors.white, fontSize: 15
          )),
          ColumnSpace(3),
          Consumer<BalanceProvider>(
            builder: (context, value, child) {
              return Row(
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                                text: '$CURRENCY_SYMBOL ${moneyFormat.format(value.silverBalance)}',
                                style: sfProTextStyle.copyWith(
                                    color: Colors.white, fontSize: 40, fontWeight: FontWeight.w700
                                )
                            ),
                          ]
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.sync, color: Colors.white, size: 40),
                    onPressed: () => Provider.of<RateProvider>(context, listen: false).initialize(),
                  ),
                ],
              );
            },
          ),
          ColumnSpace(24),
          SingleChildScrollView(
            child: Consumer<RateProvider>(
              builder: (context, value, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Color(0xFF4CD964),
                            child: Icon(Icons.arrow_upward, color: Colors.white,),
                          ),
                          RowSpace(8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Buy at", style: subtitleStyle.copyWith(
                                  color: Colors.white, fontWeight: FontWeight.w400
                              ),),
                              Text("$CURRENCY_SYMBOL ${moneyFormat.format(value.silverRate.buy)}", style: subtitleStyle.copyWith(
                                  color: Colors.white, fontWeight: FontWeight.w500
                              ),),
                            ],
                          )
                        ],
                        mainAxisSize: MainAxisSize.max,
                      ),
                    ),
                    RowSpace(10),
                    Container(
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Color(0xFFFF9500),
                            child: Icon(Icons.arrow_downward_sharp, color: Colors.white,),
                          ),
                          RowSpace(8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Sell at", style: subtitleStyle.copyWith(
                                  color: Colors.white, fontWeight: FontWeight.w400
                              ),),
                              Text("$CURRENCY_SYMBOL ${moneyFormat.format(value.silverRate.sell)}", style: subtitleStyle.copyWith(
                                  color: Colors.white, fontWeight: FontWeight.w500
                              ),),
                            ],
                          )
                        ],
                        mainAxisSize: MainAxisSize.max,
                      ),
                    ),
                  ],
                );
              },
            ),
            scrollDirection: Axis.horizontal,
          ),
          ColumnSpace(20),
          InkWell(
            onTap: () => Navigator.of(context).pushNamed(TRANSACTION_HISTORY_ROUTE, arguments: 'silver'),
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