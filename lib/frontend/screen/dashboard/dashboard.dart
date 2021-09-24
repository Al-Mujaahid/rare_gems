import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:rare_gem/frontend/providers/settings/profile_provider.dart';
import 'package:rare_gem/frontend/screen/dashboard/investment.dart';
import 'package:rare_gem/frontend/screen/dashboard/trade.dart';
import 'package:rare_gem/frontend/screen/dashboard/wallet.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/utils/styles/colors.dart';
import 'package:rare_gem/utils/styles/text.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ColumnSpace(70),
              Text('Welcome Back!',
                  style: subtitleStyle.copyWith(fontSize: 16)),
              Consumer<ProfileProvider>(
                builder: (context, value, child) {
                  return Text(
                    "${value.user != null ? value.user['name'] : 'loading...'}",
                    style: subtitleStyle.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: Colors.black),
                  );
                },
              ),
              ColumnSpace(35),
              Expanded(
                child: DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      Container(
                        child: TabBar(
                          unselectedLabelStyle:
                              unSelectedBottomNavLabelStyle.copyWith(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                          unselectedLabelColor: Colors.black,
                          overlayColor: MaterialStateProperty.resolveWith(
                              (states) => primaryColor),
                          labelStyle: unSelectedBottomNavLabelStyle.copyWith(
                              fontSize: 13, fontWeight: FontWeight.w700),
                          indicator: BoxDecoration(
                            color: primaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                          ),
                          indicatorPadding:
                              const EdgeInsets.symmetric(vertical: 0),
                          indicatorWeight: 0.4,
                          labelPadding: const EdgeInsets.symmetric(vertical: 0),
                          mouseCursor: MouseCursor.uncontrolled,
                          tabs: [
                            Tab(
                              child: Text("Overview"),
                            ),
                            Tab(
                              child: Text("Investments"),
                            ),
                            Tab(
                              child: Text("Trade"),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: TabBarView(
                        children: [
                          WalletOverView(),
                          InvestmentOverview(),
                          TradeOverview(),
                        ],
                      ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.check,
            color: Colors.white,
          ),
        ));
  }
}
