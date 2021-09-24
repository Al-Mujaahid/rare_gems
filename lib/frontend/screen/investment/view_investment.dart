import 'package:flutter/material.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/src/helpers/textHelper.dart';
import 'package:rare_gem/src/models/entities/Investment.dart';
import 'package:rare_gem/src/services/index.dart';
import 'package:rare_gem/utils/constants/constants.dart';
import 'package:rare_gem/utils/styles/colors.dart';
import 'package:rare_gem/utils/styles/text.dart';

class ViewInvestment extends StatefulWidget {
  ViewInvestment({Key? key, required this.investmentId}) : super(key: key);

  int investmentId;

  @override
  _ViewInvestmentState createState() => _ViewInvestmentState();
}

class _ViewInvestmentState extends State<ViewInvestment> {

  Investment? investment;
  void loadInvestment() async {
    var invRes = await investmentService.getInvestment(id: widget.investmentId);
    if (invRes.status == true) {
      setState(() {
        investment = Investment.fromJson(invRes.data['data']);
        investmentDate = convertStringToDate(investment!.investmentDate!);
        returnDate = convertStringToDate(investment!.returnDate!);
      });
    }
  }

  DateTime? investmentDate;
  DateTime? returnDate;
  DateTime now = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadInvestment();
  }


  @override
  Widget build(BuildContext context) {
    investmentService.getInvestment(id: widget.investmentId);

    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ColumnSpace(56),
            Row(
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(Icons.close, color: Colors.black, size: 24,),
                ),
                Expanded(
                  child: Center(
                    child: Text('Investment Status', style: interTextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),),
                  ),
                )
              ],
            ),
            ColumnSpace(26),
            if (investment == null)
              ...[
                Expanded(
                  child: Container(
                      child: Center(child: CircularProgressIndicator())
                  ),
                )
              ],
            if (investment != null)
              ...[
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 37, horizontal: 26),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: Color(0xFFEFEFF4)
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8))
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: (investment!.status == 'active' || investment!.status == 'settled') ? successColor : (investment!.status == 'pending') ? warningColor : dangerColor,
                        radius: 40,
                        child: Icon(
                          (investment!.status == 'settled') ? Icons.check
                          : (investment!.status == 'active') ? Icons.sync_alt
                          : (investment!.status == 'pending') ? Icons.timelapse_outlined
                          : Icons.close, color: Colors.white, size: 40,),
                      ),
                      RowSpace(23),
                      Text("${ucFirst(investment!.status!)}", style: sfProTextStyle.copyWith(
                          fontWeight: FontWeight.w700, fontSize: 40
                      ),)
                    ],
                  ),
                ),
                ColumnSpace(15),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: Color(0xFFEFEFF4)
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8))
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("${returnDate!.difference(now).inDays}", style: sfProTextStyle.copyWith(
                          fontSize: 34, color: primaryColor, fontWeight: FontWeight.w700
                      ),),
                      ColumnSpace(3),
                      Text("Days Remaining", style: subtitleStyle,),
                      ColumnSpace(40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Package", style: interTextStyle.copyWith(
                                  color: primaryColor, fontWeight: FontWeight.w600, fontSize: 17
                              ),),
                              ColumnSpace(8),
                              Text("Amount", style: subtitleStyle,),
                              ColumnSpace(8),
                              Text("Duration", style: subtitleStyle,),
                              ColumnSpace(8),
                              Text("ROI", style: subtitleStyle,),
                              ColumnSpace(8),
                              Text("Unit Purchased", style: subtitleStyle,),
                              ColumnSpace(8),
                              Text("Return Date", style: subtitleStyle,),
                              ColumnSpace(8),
                              Text("Investment Date", style: subtitleStyle,),
                            ],
                          ),
                          RowSpace(20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${investment!.package!.name}", style: interTextStyle.copyWith(
                                    color: primaryColor, fontWeight: FontWeight.w600, fontSize: 17
                                ),),
                                ColumnSpace(8),
                                Text("$CURRENCY_SYMBOL ${moneyFormat.format(investment!.amount)}", style: interTextStyle.copyWith(
                                    fontSize: 17
                                ),),
                                ColumnSpace(8),
                                Text("${(returnDate!.difference(investmentDate!).inDays / 30).ceil()} Months", style: interTextStyle.copyWith(
                                    fontSize: 17
                                ),),
                                ColumnSpace(8),
                                Text("${investment!.package!.roi} %", style: interTextStyle.copyWith(
                                    fontSize: 17
                                ),),
                                ColumnSpace(8),
                                Text("${investment!.slots} Units", style: interTextStyle.copyWith(
                                    fontSize: 17
                                ),),
                                ColumnSpace(8),
                                Text("${investment!.returnDate!.split('at').first}", style: interTextStyle.copyWith(
                                    fontSize: 17
                                ),),
                                ColumnSpace(8),
                                Text("${investment!.investmentDate!.split('at').first}", style: interTextStyle.copyWith(
                                    fontSize: 17
                                ),),
                              ],
                            ),
                          ),
                        ],
                      ),
                      ColumnSpace(31),
                      Text("Funding Information", style: sfProTextStyle.copyWith(
                          fontSize: 24, color: primaryColor, fontWeight: FontWeight.w700
                      ),),
                      ColumnSpace(11),
                      Container(
                        height: 1, color: Color(0xFFEFEFF4),
                      ),
                      ColumnSpace(11),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Amount Invested", style: subtitleStyle,),
                              ColumnSpace(8),
                              Text("ROI Amount", style: subtitleStyle,),
                              ColumnSpace(8),
                              Text("Expected Returns", style: subtitleStyle,),
                            ],
                          ),
                          RowSpace(20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("$CURRENCY_SYMBOL ${moneyFormat.format((investment!.amount!))}", style: interTextStyle.copyWith(
                                    fontSize: 17
                                ),),
                                ColumnSpace(8),
                                Text("$CURRENCY_SYMBOL ${moneyFormat.format((investment!.package!.roi! / 100) * investment!.amount!)}", style: interTextStyle.copyWith(
                                    fontSize: 17
                                ),),
                                ColumnSpace(8),
                                Text("$CURRENCY_SYMBOL ${moneyFormat.format(((investment!.package!.roi! / 100) * investment!.amount!) + (investment!.amount!))}", style: interTextStyle.copyWith(
                                    fontSize: 17
                                ),),
                              ],
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ],
            
          ],
        ),
      ),
    );
  }
}
