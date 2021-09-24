import 'dart:async';

import 'package:rare_gem/frontend/helper/interaction.dart';
import 'package:rare_gem/frontend/providers/base_provider.dart';
import 'package:rare_gem/src/services/index.dart';
import 'package:rare_gem/utils/constants/constants.dart';
import 'package:rare_gem/utils/constants/routes.dart';
import 'package:rare_gem/utils/styles/theme.dart';
import 'package:flutter/material.dart';

class AppProvider extends BaseProvider {
  String theme = 'light';

  changeTheme() {
    if (theme == 'light') {
      theme = 'dark';
    } else {
      theme = 'light';
    }
    print('Theme Changes');
    notifyListeners();
  }

  ThemeData getTheme() {
    if (theme == 'light') {
      return lightTheme;
    }
    return darkTheme;
  }

  watchToken() async {
    Timer.periodic(Duration(minutes: 9), (timer) async {
      print('Refreshing token....');
      var res = await authService.refreshToken();
      await localStorageService.set(USER_BOX, TOKEN_KEY, res.data['access_token']);
      print('Token Refreshed...');
    });
  }

  logout(BuildContext context) {
    MessageAlert.showConfirmAlert(context, 'Are you sure you want to logout?', () async {
      MessageAlert.showLoadingAlert(context, 'please wait...');
      await localStorageService.unset(USER_BOX, USER_KEY);
      await localStorageService.unset(USER_BOX, TOKEN_KEY);
      await localStorageService.set(USER_BOX, USER_LOGGED_IN_KEY, false);
      closeAlert(context);

      Navigator.of(context).pushNamedAndRemoveUntil(INITIAL_PAGE_ROUTE, (route) => false);
    });
  }
}
