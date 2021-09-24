import 'package:flutter/material.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/src/services/index.dart';
import 'package:rare_gem/utils/constants/constants.dart';
import 'package:rare_gem/utils/styles/colors.dart';
import 'package:rare_gem/utils/styles/text.dart';

class ViewTransactionScreen extends StatelessWidget {
  ViewTransactionScreen({Key? key, this.tid}) : super(key: key);
  String? tid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: FutureBuilder(
          future: transactionService.getTransaction(tid!),
          builder: (context, snapshot) {
            if ([ConnectionState.waiting, ConnectionState.active].contains(snapshot.connectionState)) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if ([ConnectionState.done].contains(snapshot.connectionState)) {
              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ColumnSpace(56),
                  Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.close, color: Colors.black, size: 24,),
                      ),
                      Expanded(
                        child: Center(
                          child: Text('Transaction Status', style: interTextStyle.copyWith(
                            fontWeight: FontWeight.w600,
                          ),),
                        ),
                      )
                    ],
                  ),
                  ColumnSpace(26),

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
                          backgroundColor: dangerColor,
                          radius: 40,
                          child: Icon(Icons.arrow_downward, color: Colors.white, size: 40,),
                        ),
                        RowSpace(23),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Gold Trade", style: sfProTextStyle.copyWith(
                                fontWeight: FontWeight.w700, fontSize: 40
                            ),),
                            ColumnSpace(2),
                            Text("Pending", style: interTextStyle.copyWith(
                                fontWeight: FontWeight.w400, fontSize: 13, color: warningColor
                            ),),
                          ],
                        )
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

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Product", style: subtitleStyle,),
                                ColumnSpace(8),
                                Text("Type", style: subtitleStyle,),
                                ColumnSpace(8),
                                Text("Amount", style: subtitleStyle,),
                                ColumnSpace(8),
                                Text("Unit", style: subtitleStyle,),
                                ColumnSpace(8),
                                Text("Date", style: subtitleStyle,),
                                ColumnSpace(8),
                                Text("Time", style: subtitleStyle,),
                                ColumnSpace(8),
                                Text("Method", style: subtitleStyle,),
                              ],
                            ),
                            RowSpace(20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Standard Package", style: interTextStyle.copyWith(
                                    fontSize: 17,
                                  ),),
                                  ColumnSpace(8),
                                  Text("$CURRENCY_SYMBOL ${moneyFormat.format(50000)}", style: interTextStyle.copyWith(
                                    fontSize: 17,
                                  ),),
                                  ColumnSpace(8),
                                  Text("3 Months", style: interTextStyle.copyWith(
                                    fontSize: 17,
                                  ),),
                                  ColumnSpace(8),
                                  Text("15 %", style: interTextStyle.copyWith(
                                    fontSize: 17,
                                  ),),
                                  ColumnSpace(8),
                                  Text("2 Units", style: interTextStyle.copyWith(
                                    fontSize: 17,
                                  ),),
                                  ColumnSpace(8),
                                  Text("April 19, 2020", style: interTextStyle.copyWith(
                                    fontSize: 17,
                                  ),),
                                  ColumnSpace(8),
                                  Text("May 20, 2020", style: interTextStyle.copyWith(
                                    fontSize: 17,
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
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
