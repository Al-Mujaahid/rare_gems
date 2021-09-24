import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rare_gem/frontend/providers/dashboard_provider.dart';
import 'package:rare_gem/frontend/providers/wallet/rate_provider.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/utils/constants/constants.dart';
import 'package:rare_gem/utils/styles/colors.dart';
import 'package:rare_gem/utils/styles/text.dart';

class TradeOverview extends StatelessWidget {
  const TradeOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<DashboardProvider>(
          builder: (context, value, child) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFA644FF),
                        borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Consumer<DashboardProvider>(
                      builder: (context, value, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Trade Wallet", style: subtitleStyle.copyWith(
                                color: Colors.white, fontSize: 13
                            ),),
                            Text("3.78 units", style: sfProTextStyle.copyWith(
                                fontSize: 40, fontWeight: FontWeight.w700, color: Colors.white
                            ),),
                            ColumnSpace(16),
                            Container(
                              color: Color(0xffEFEFF4), height: 1,
                            ),
                            ColumnSpace(17),

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
                                                Text("Buy", style: subtitleStyle.copyWith(
                                                    color: Colors.white, fontWeight: FontWeight.w400
                                                ),),
                                                Text("$CURRENCY_SYMBOL ${moneyFormat.format(value.goldRate.buy)}", style: subtitleStyle.copyWith(
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
                                                Text("Sell", style: subtitleStyle.copyWith(
                                                    color: Colors.white, fontWeight: FontWeight.w400
                                                ),),
                                                Text("$CURRENCY_SYMBOL ${moneyFormat.format(value.goldRate.sell)}", style: subtitleStyle.copyWith(
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
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  ColumnSpace(39),
                  // Text('Services', style: sfProTextStyle.copyWith(
                  //     fontSize: 17, fontWeight: FontWeight.w700
                  // )),
                  // ColumnSpace(11),
                  // Expanded(
                  //   child: GridView.count(
                  //     crossAxisCount: 3,
                  //     children: [
                  //       Container(
                  //         decoration: BoxDecoration(
                  //           color: Color(0xFFEFEFF4),
                  //           borderRadius:
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            );
          },
        )
    );
  }
}
