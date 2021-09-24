
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rare_gem/frontend/widgets/progress_bar.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/src/helpers/textHelper.dart';
import 'package:rare_gem/src/models/entities/Investment.dart';
import 'package:rare_gem/utils/constants/constants.dart';
import 'package:rare_gem/utils/styles/colors.dart';
import 'package:rare_gem/utils/styles/text.dart';

class InvestmentWidget extends StatelessWidget {
  InvestmentWidget({Key? key, required this.investment}) : super(key: key);

  Investment investment;

  @override
  Widget build(BuildContext context) {
    DateTime investmentDate = convertStringToDate(investment.investmentDate!);
    DateTime returnDate = convertStringToDate(investment.returnDate!);
    DateTime now = DateTime.now();


    double roi = (investment.package!.roi! / 100) * investment.amount!;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7.5),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: Color(0xFFD8D8D8))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${investment.package!.name}", style: subtitleStyle,),
                  ColumnSpace(2),
                  Text("$CURRENCY_SYMBOL ${moneyFormat.format(investment.amount)}", style: subtitleStyle.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w500
                  ),),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Expected Returns", style: subtitleStyle,),
                  ColumnSpace(2),
                  Text("$CURRENCY_SYMBOL ${moneyFormat.format(roi)}", style: subtitleStyle.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w500
                  ),),
                ],
              ),
            ],
          ),
          ColumnSpace(8),
          RareGemProgressBar(
            percentage: (returnDate.difference(now).inDays/ investmentDate.difference(returnDate).inDays) * 100,
          ),
          ColumnSpace(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${investment.package!.roi}% - ${investment.slots} Slots", style: subtitleStyle.copyWith(
                  color: Colors.black
              ),),
              RichText(
                text: TextSpan(
                    style: sfProTextStyle.copyWith(
                        color: disabledColor
                    ),
                    children: [
                      TextSpan(
                          text: "${returnDate.difference(now).inDays}", style: TextStyle(color: Colors.black)
                      ),
                      TextSpan(
                          text: " Days Left"
                      ),
                    ]
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
