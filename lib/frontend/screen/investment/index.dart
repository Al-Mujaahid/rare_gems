import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rare_gem/frontend/providers/investment/investment_provider.dart';
import 'package:rare_gem/frontend/widgets/InvestmentWidget.dart';
import 'package:rare_gem/frontend/widgets/button.dart';
import 'package:rare_gem/frontend/widgets/progress_bar.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/utils/constants/constants.dart';
import 'package:rare_gem/utils/constants/routes.dart';
import 'package:rare_gem/utils/styles/colors.dart';
import 'package:rare_gem/utils/styles/text.dart';

class InvestmentScreen extends StatelessWidget {
  InvestmentScreen({Key? key}) : super(key: key);

  bool hasInvestment = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ColumnSpace(56),
            Text('Investment', style: sfProTextStyle.copyWith(
                fontWeight: FontWeight.w700, fontSize: 34
            ),),
            ColumnSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RareGemPrimaryButton(
                  child: Row(
                    children: [
                      Icon(Icons.add_circle_rounded, color: Colors.black26,),
                      RowSpace(5),
                      Text("Create New", style: subtitleStyle.copyWith(
                        fontSize: 15, color: Colors.white, fontWeight: FontWeight.w700
                      ),)
                    ],
                  ),
                  onClick: () => Navigator.of(context).pushNamed(CREATE_INVESTMENT_ROUTE),
                ),
                RareGemPrimaryOutlineButton(
                  child: Row(
                    children: [
                      Text('Investment History', style: subtitleStyle.copyWith(
                        fontSize: 15, color: primaryColor, fontWeight: FontWeight.w700
                      ),),
                    ],
                  ),
                  onClick: () => Navigator.of(context).pushNamed(INVESTMENT_HISTORY_ROUTE),
                ),
              ],
            ),
            ColumnSpace(41),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text("Active Investments", style: subtitleStyle.copyWith(
                            fontWeight: FontWeight.w700
                        ),),
                      ),
                      IconButton(
                          icon: Icon(Icons.sync),
                          onPressed: () => Provider.of<InvestmentProvider>(context, listen: false).initialize()
                      )
                    ],
                  ),
                  Consumer<InvestmentProvider>(
                    builder: (context, value, child) {
                      return Expanded(
                        child: value.loading ? Container(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ) : Container(
                          height: 200,
                          child: value.investments.length == 0 ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () => value.initialize(),
                                child: Text("No active\ninvestment", textAlign: TextAlign.center, style: sfProTextStyle.copyWith(
                                    fontSize: 34, fontWeight: FontWeight.w700
                                ),),
                              ),
                              ColumnSpace(16),
                              Text("Your active investment will appear here.", style: subtitleStyle,)
                            ],
                          ) :  ListView.builder(
                            itemCount: value.activeInvestments.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () => Navigator.of(context).pushNamed(VIEW_INVESTMENT_ROUTE, arguments: value.activeInvestments[index].id!),
                                child: InvestmentWidget(investment: value.activeInvestments[index],),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
