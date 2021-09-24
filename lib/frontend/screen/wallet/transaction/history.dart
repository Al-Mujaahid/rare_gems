import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rare_gem/frontend/providers/app_provider.dart';
import 'package:rare_gem/frontend/providers/wallet/transaction_provider.dart';
import 'package:rare_gem/frontend/widgets/TransactionHistoryTileWidget.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/src/models/entities/Transaction.dart';
import 'package:rare_gem/utils/constants/routes.dart';
import 'package:rare_gem/utils/styles/colors.dart';
import 'package:rare_gem/utils/styles/text.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<AppProvider>(context, listen: false).setBuildContext = context;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ColumnSpace(55),
            Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context) ,
                  child: Icon(Icons.arrow_back_ios, color: Colors.black, size: 24,),
                ),
                Expanded(
                  child: Center(
                    child: Text('Transaction History', style: subtitleStyle.copyWith(
                        fontWeight: FontWeight.w600, color: Colors.black
                    ),),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(Icons.filter_alt, color: Colors.black, size: 24,),
                ),
              ],
            ),
            ColumnSpace(11),
            Expanded(
              child: Consumer<TransactionHistoryProvider>(
                builder: (context, value, child) {
                  return value.loading ? Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ) : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      value.transactions.length == 0 ? Container() : Text("Transactions | ${value.type}", style: sfProTextStyle.copyWith(
                          fontSize: 17,fontWeight: FontWeight.w700, color: Colors.black
                      ),),
                      ColumnSpace(19),
                      Expanded(
                        child: Container(
                          height: 400,
                          child: value.transactions.length == 0 ?  Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("No Transaction", style: sfProTextStyle.copyWith(
                                    fontSize: 20, fontWeight: FontWeight.w700
                                  ),),
                                  ColumnSpace(5),
                                  Text("Your transactions will be listed here"),
                                ],
                              ),
                            ),
                          ) : ListView.builder(
                            itemCount: value.transactions.length,
                             itemBuilder: (context, index) {
                               Transaction t = value.transactions[index];
                               return TransactionHistoryTileWidget(transaction: t);
                             },
                          )
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
