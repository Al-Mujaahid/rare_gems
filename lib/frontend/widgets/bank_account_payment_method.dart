import 'package:flutter/material.dart';
import 'package:rare_gem/frontend/widgets/button.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/utils/styles/colors.dart';
import 'package:rare_gem/utils/styles/text.dart';

class BankPaymentDetail extends StatelessWidget {
  const BankPaymentDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Access Bank", style: interTextStyle.copyWith(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.w600
            )),
            ColumnSpace(2),
            Text("0008399441", style: interTextStyle.copyWith(
                fontSize: 34, color: Colors.white, fontWeight: FontWeight.w600
            )),
            ColumnSpace(2),
            Text("Rare Gems Limited", style: interTextStyle.copyWith(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.w600
            )),
            ColumnSpace(2),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 100,
                child: RareGemFilledSmallButton(
                  color: Colors.white,
                  child: Text('Copy', style: interTextStyle.copyWith(
                      fontSize: 13, color: primaryColor
                  ),),
                ),
              ),
            )
          ],
        )
    );
  }
}
