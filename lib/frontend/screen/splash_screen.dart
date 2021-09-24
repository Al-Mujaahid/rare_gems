import 'package:rare_gem/frontend/providers/app_provider.dart';
import 'package:rare_gem/src/services/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rare_gem/utils/constants/constants.dart';
import 'package:rare_gem/utils/constants/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navigatorToNextPage() async {
    await Future.delayed(Duration(seconds: 4));
    bool isLoggedIn = await localStorageService.get(USER_BOX, USER_LOGGED_IN_KEY) ?? false;
    bool notFirstTime = await localStorageService.get(USER_BOX, IS_FIRST_TIME_KEY) ?? false;
    if (notFirstTime) {
      if (isLoggedIn) {
        // print("Already logged in");
        Navigator.pushNamedAndRemoveUntil(context, ALREADY_LOGGEDIN_PAGE_ROUTE, (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(context, ON_BOARD_PAGE_ROUTE, (route) => false);
      }
    } else {
      Navigator.pushNamedAndRemoveUntil(context, INTRO_PAGE_ROUTE, (route) => false);
    }
  }

  @override
  void initState() {
    super.initState();
    navigatorToNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return splashBody();
  }
}

class splashBody extends StatelessWidget {
  // const splashBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(child: Image.asset('assets/images/splash_image.png'))
        ],
      )
    );
  }
}
