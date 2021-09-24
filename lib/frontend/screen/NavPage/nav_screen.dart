import 'package:flutter/material.dart';
import 'package:rare_gem/frontend/screen/dashboard/dashboard.dart';
import 'package:rare_gem/frontend/screen/error/page_not_found.dart';
import 'package:rare_gem/frontend/screen/investment/index.dart';
import 'package:rare_gem/frontend/screen/settings/settings.dart';
import 'package:rare_gem/frontend/screen/trade/trade.dart';
import 'package:rare_gem/frontend/screen/wallet/main/index.dart';
import 'package:rare_gem/frontend/screen/wallet/wallet.dart';

import 'nav_bar.dart';

class NavScreen extends StatefulWidget {
  NavScreen({Key? key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int currentIndex = 0;

  changePage(index) {
    setState(() {
      currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      Dashboard(),
      InvestmentScreen(),
      WalletScreen(),
      TradeScreen(),
      Settings(),
    ];
    
    return Scaffold(
      body: pages.length >= currentIndex ? pages[currentIndex] : PageNotFound(),
      bottomNavigationBar: BottomNavBar(
        currentIndex: currentIndex,
        onChange: changePage
      ),
    );
  }
}
