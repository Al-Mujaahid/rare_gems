import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rare_gem/frontend/providers/dashboard_provider.dart';
import 'package:rare_gem/frontend/widgets/progress_bar.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/utils/constants/constants.dart';
import 'package:rare_gem/utils/constants/constants.dart';
import 'package:rare_gem/utils/constants/constants.dart';
import 'package:rare_gem/utils/constants/constants.dart';
import 'package:rare_gem/utils/constants/routes.dart';
import 'package:rare_gem/utils/styles/colors.dart';
import 'package:rare_gem/utils/styles/text.dart';

class InvestmentOverview extends StatelessWidget {
  const InvestmentOverview({Key? key}) : super(key: key);

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
                        color: primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Consumer<DashboardProvider>(
                      builder: (context, value, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Active Investment", style: subtitleStyle.copyWith(
                                color: Colors.white, fontSize: 13
                            ),),
                            Text("$CURRENCY_SYMBOL ${moneyFormat.format(value.activeInvestment)}", style: sfProTextStyle.copyWith(
                                fontSize: 40, fontWeight: FontWeight.w700, color: Colors.white
                            ),),
                            ColumnSpace(16),
                            Container(
                              color: Color(0xffEFEFF4), height: 1,
                            ),
                            ColumnSpace(17),
                            SingleChildScrollView(
                              child: Row(
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
                                            Text("Income", style: subtitleStyle.copyWith(
                                                color: Colors.white, fontWeight: FontWeight.w400
                                            ),),
                                            Text("$CURRENCY_SYMBOL ${moneyFormat.format(value.paidInvestment)}", style: subtitleStyle.copyWith(
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
                                            Text("Outcome", style: subtitleStyle.copyWith(
                                                color: Colors.white, fontWeight: FontWeight.w400
                                            ),),
                                            Text("$CURRENCY_SYMBOL ${moneyFormat.format(value.totalInvestment)}", style: subtitleStyle.copyWith(
                                                color: Colors.white, fontWeight: FontWeight.w500
                                            ),),
                                          ],
                                        )
                                      ],
                                      mainAxisSize: MainAxisSize.max,
                                    ),
                                  ),
                                ],
                              ),
                              scrollDirection: Axis.horizontal,
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  ColumnSpace(19),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(color: Color(0xFFD8D8D8))
                    ),
                    child: Consumer<DashboardProvider>(
                      builder: (context, value, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Credit Progress", style: subtitleStyle,),
                                    ColumnSpace(2),
                                    Text("$CURRENCY_SYMBOL ${moneyFormat.format(value.paidInvestment)}", style: subtitleStyle.copyWith(
                                        color: Colors.black, fontWeight: FontWeight.w500
                                    ),),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("Available Credit Limit", style: subtitleStyle,),
                                    ColumnSpace(2),
                                    Text("$CURRENCY_SYMBOL ${moneyFormat.format(value.activeInvestment)}", style: subtitleStyle.copyWith(
                                        color: Colors.black, fontWeight: FontWeight.w500
                                    ),),
                                  ],
                                ),
                              ],
                            ),
                            ColumnSpace(8),
                            RareGemProgressBar(
                              percentage: ((value.paidInvestment / value.totalInvestment) * 100).floorToDouble(),
                            ),
                            ColumnSpace(8),
                            RichText(
                              text: TextSpan(
                                  style: sfProTextStyle.copyWith(
                                      color: disabledColor
                                  ),
                                  children: [
                                    TextSpan(
                                        text: "Your credit progress is "
                                    ),
                                    TextSpan(
                                        text: "${((value.paidInvestment / value.totalInvestment) * 100).ceil()}%", style: sfProTextStyle.copyWith(
                                      fontWeight: FontWeight.w600, color: Colors.black
                                    )
                                    )
                                  ]
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        )
    );
  }
}
