import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rare_gem/frontend/providers/investment/history_provider.dart';
import 'package:rare_gem/frontend/widgets/InvestmentHistoryWidget.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/frontend/widgets/tab_chip.dart';
import 'package:rare_gem/utils/constants/constants.dart';
import 'package:rare_gem/utils/constants/routes.dart';
import 'package:rare_gem/utils/styles/colors.dart';
import 'package:rare_gem/utils/styles/text.dart';

class InvestmentHistoryScreen extends StatelessWidget {
  InvestmentHistoryScreen({Key? key}) : super(key: key);

  bool hasInvestment = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(Icons.arrow_back_ios, color: Color(0xFF030303),),
        ),
        centerTitle: true,
        toolbarHeight: 68,
        title: Text("Investment History", style: subtitleStyle.copyWith(
            fontSize: 17, fontWeight: FontWeight.w600, color: Color(0xFF030303)
        ),),
        backgroundColor: Colors.white, elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Color(0xFF030303),), onPressed: () {}
          )
        ],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ColumnSpace(18),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 18),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFEFEFF4),
                    offset: Offset(0, 1), blurRadius: 0, spreadRadius: 0
                  )
                ]
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Consumer<InvestmentHistoryProvider>(
                  builder: (context, value, child) {
                    return Row(
                      children: [
                        InkWell(
                          child: RareGemTabChip(
                            text: "All", isActive: value.status == '',
                          ),
                          onTap: () => value.loadHistory(''),
                        ),
                        InkWell(
                          onTap: () => value.loadHistory('active'),
                          child: RareGemTabChip(
                            text: "Active", isActive: value.status == 'active',
                          ),
                        ),
                        InkWell(
                          onTap: () => value.loadHistory('settled'),
                          child: RareGemTabChip(
                            text: "Completed", isActive: value.status == 'settled',
                          ),
                        ),
                        InkWell(
                          onTap: () => value.loadHistory('pending'),
                          child: RareGemTabChip(
                            text: "Pending", isActive: value.status == 'pending',
                          ),
                        ),
                        InkWell(
                          onTap: () => value.loadHistory('cancelled'),
                          child: RareGemTabChip(
                            text: "Cancelled", isActive: value.status == 'cancelled',
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            ColumnSpace(19),

            Expanded(
              flex: 1,
              child: Consumer<InvestmentHistoryProvider>(
                builder: (context, value, child) {
                  return value.loading ? Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ) : ListView.separated(
                    itemCount: value.investmentHistory.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () => Navigator.of(context).pushNamed(VIEW_INVESTMENT_ROUTE, arguments: value.investmentHistory[index].id),
                      child: InvestmentHistoryWidget(
                        investment: value.investmentHistory[index],
                      ),
                    ),
                    separatorBuilder: (context, index) => Container(
                      height: 1, margin: const EdgeInsets.symmetric(vertical: 8), color: Color(0xFFEFEFF4),
                    ),
                  );
                },
              ),
            )

          ],
        ),
      ),
    );
  }
}
