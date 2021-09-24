import 'package:flutter/material.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/src/models/entities/Investment.dart';
import 'package:rare_gem/utils/constants/constants.dart';
import 'package:rare_gem/utils/styles/colors.dart';
import 'package:rare_gem/utils/styles/text.dart';

class InvestmentHistoryWidget extends StatelessWidget {
  InvestmentHistoryWidget({Key? key, required this.investment}) : super(key: key);
  Investment investment;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          Container(
            child: Column(
              children: [
                Text('02-05', style: subtitleStyle.copyWith(
                    fontSize: 13
                ),),
                ColumnSpace(2),
                Text('2021', style: subtitleStyle.copyWith(
                    fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black
                ),),
              ],
            ),
          ),
          RowSpace(21),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("${investment.package!.name}", style: subtitleStyle.copyWith(
                      fontWeight: FontWeight.w600, fontSize: 15, color: Colors.black
                  ),),
                  Text('${investment.slots} Slots - ${investment.package!.roi}% ROI', style: subtitleStyle.copyWith(
                      fontSize: 13
                  ),)
                ],
              ),
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("$CURRENCY_SYMBOL ${moneyFormat.format(investment.amount)}", style: subtitleStyle.copyWith(
                    fontWeight: FontWeight.w700, color: Colors.black
                ),),
                Text('${investment.status}', style: subtitleStyle.copyWith(
                    color: (investment.status == 'active' || investment.status == 'settled') ? successColor : (investment.status == 'pending') ? warningColor : dangerColor, fontSize: 13
                ),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
