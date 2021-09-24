import 'package:flutter/material.dart';
import 'package:rare_gem/utils/styles/colors.dart';
import 'package:rare_gem/utils/styles/text.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({Key? key, this.currentIndex = 0, required this.onChange}) : super(key: key);
  int currentIndex;
  Function onChange;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedIconTheme: IconThemeData(
        color: primaryColor
      ),
      unselectedIconTheme: IconThemeData(
        color: disabledColor
      ),
      selectedLabelStyle: selectedBottomNavLabelStyle,
      unselectedLabelStyle: unSelectedBottomNavLabelStyle,
      showSelectedLabels: true, showUnselectedLabels: true,
      unselectedItemColor: disabledColor, type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: (int index) => this.onChange(index),
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Investment'),
        BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet_outlined), label: 'Wallet'),
        BottomNavigationBarItem(icon: Icon(Icons.stacked_line_chart), label: 'Trade'),
        BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: 'Setting'),
      ],
    );
  }
}
