// @dart=2.9

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rare_gem/frontend/providers/app_provider.dart';
import 'package:rare_gem/frontend/providers/dashboard_provider.dart';
import 'package:rare_gem/frontend/providers/investment/history_provider.dart';
import 'package:rare_gem/frontend/providers/investment/investment_provider.dart';
import 'package:rare_gem/frontend/providers/settings/profile_provider.dart';
import 'package:rare_gem/frontend/providers/trade_provider.dart';
import 'package:rare_gem/frontend/providers/wallet/balance_provider.dart';
import 'package:rare_gem/utils/constants/constants.dart';
import 'package:rare_gem/utils/routes.dart';
import 'package:rare_gem/utils/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'frontend/providers/wallet/rate_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var path = await getApplicationDocumentsDirectory();
  Hive.init(path.path);
  await Hive.openBox(USER_BOX);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AppProvider()),
      ChangeNotifierProvider(create: (context) => TradeProvider()),
      ChangeNotifierProvider(create: (context) => DashboardProvider()),
      ChangeNotifierProvider(create: (context) => ProfileProvider()),
      ChangeNotifierProvider(create: (context) => BalanceProvider()),
      ChangeNotifierProvider(create: (context) => RateProvider()),
      ChangeNotifierProvider(create: (context) => InvestmentProvider()),
      ChangeNotifierProvider(create: (context) => InvestmentHistoryProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, value, child) {
        value.watchToken();
        return MaterialApp(
          title: '$APP_NAME',
          theme: value.getTheme(),
          initialRoute: '/',
          onGenerateRoute: (settings) => RouteGenerator.onRouteGenerate(settings),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
