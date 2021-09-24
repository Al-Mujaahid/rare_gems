import 'package:flutter/material.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/src/models/entities/Transaction.dart';
import 'package:rare_gem/utils/styles/colors.dart';
import 'package:rare_gem/utils/styles/text.dart';

class TransactionHistoryTileWidget extends StatelessWidget {
  TransactionHistoryTileWidget({Key? key, required this.transaction}) : super(key: key);
  Transaction transaction;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: (transaction.status == 'approved' || transaction.status == 'settled') ? successColor : (transaction.status == 'pending') ? warningColor : dangerColor,
            radius: 25,
            child: Icon(
              (transaction.status == 'approved') ? Icons.check
                  : (transaction.status == 'active') ? Icons.sync_alt
                  : (transaction.status == 'pending') ? Icons.timelapse_outlined
                  : Icons.close,
              color: Colors.white, size: 30,),
          ),
          RowSpace(16),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${transaction.description}", style: interTextStyle.copyWith(
                            fontSize: 15, fontWeight: FontWeight.w700
                        ),),
                        ColumnSpace(2),
                        Text("${transaction.date}", style: subtitleStyle.copyWith(
                            fontSize: 13
                        ),),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("-300", style: interTextStyle.copyWith(
                            fontSize: 15, fontWeight: FontWeight.w700,
                            color: (transaction.status == 'approved' || transaction.status == 'settled') ? successColor : (transaction.status == 'pending') ? warningColor : dangerColor
                        ),),
                        ColumnSpace(2),
                        Text("${transaction.status}", style: subtitleStyle.copyWith(
                            fontSize: 13,
                            color: (transaction.status == 'approved' || transaction.status == 'settled') ? successColor : (transaction.status == 'pending') ? warningColor : dangerColor
                        ),),
                      ],
                    ),
                  ],
                ),
                ColumnSpace(12),
                Container(
                  height: 1,
                  color: Color(0xFFEFEFF4),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
