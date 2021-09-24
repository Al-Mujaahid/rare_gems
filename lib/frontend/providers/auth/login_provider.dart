import 'package:rare_gem/frontend/helper/interaction.dart'; //contains the alert dialog to give nitification
import 'package:rare_gem/frontend/providers/base_provider.dart'; //the base of our provider
import 'package:flutter/cupertino.dart'; //contains access to ios desing pattern
import 'package:rare_gem/src/services/index.dart'; // connects access to each API services + auth API Service
import 'package:rare_gem/utils/constants/constants.dart'; // Constants like months--money_format--hive--others
import 'package:rare_gem/utils/constants/routes.dart'; //contaons routings

class LoginProvider extends BaseProvider {
  String? _email;
  String? _password;
  bool formValid = false;

  var _user;
  get user => _user;

  set setUser(user) {
    _user = user;
    notifyListeners();
  }

  String get email => _email ?? '';
  String get password => _password ?? '';

  set setEmail(String email) {
    _email = email;
    checkFormIsValid();
    notifyListeners();
  }

  set setPassword(String password) {
    _password = password;
    checkFormIsValid();
    notifyListeners();
  }

  void checkFormIsValid() {
    if (((_password != null) && (_email != null)) &&
        (_password!.length >= 8) &&
        (_email!.length > 0)) {
      formValid = true;
    } else {
      formValid = false;
    }
    notifyListeners();
  }

  void login(BuildContext context) async {
    try {
      if (_email == null || _password == null) {
        MessageAlert.showErrorAlert(context, 'All fields are required');
      } else {
        MessageAlert.showLoadingAlert(context, 'Logging in progress...');
        FocusScope.of(context).unfocus();
        setLoading = true;

        var response =
            await authService.login(email: _email, password: _password);
        closeAlert(context);

        if (response.status == true) {
          localStorageService.set(USER_BOX, USER_KEY, response.data['data']);
          localStorageService.set(
              USER_BOX, TOKEN_KEY, response.data['access_token']);
          localStorageService.set(USER_BOX, USER_LOGGED_IN_KEY, true);

          // print(response.data['access_token']);
          MessageAlert.showAlert(context, "Login successful",
              onClick: () async {
            bool profileComplete = true;
            MessageAlert.showLoadingAlert(context, 'Please wait...');
            Map.from(response.data['data']).forEach((key, value) {
              if (['', null].contains(value)) {
                // print("$key ==> $value");
                // print('hmmm, going to profile registration');
                if (profileComplete) {
                  profileComplete = false;
                }
              }
            });
            closeAlert(context);
            if (!profileComplete) {
              MessageAlert.showAlert(
                  context, 'Your profile is not complete yet', onClick: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    PROFILE_REGISTRATION_ROUTE, (route) => false);
              });
            } else {
              Navigator.pushNamedAndRemoveUntil(
                  context, DASHBOARD_ROUTE, (route) => false);
            }
          });
        } else {
          print(response.message);
          MessageAlert.showErrorAlert(context, response.message!);
        }
        setLoading = false;
      }
    } catch (error) {
      setLoading = false;
      closeAlert(context);
      MessageAlert.showErrorAlert(context, 'Error: $error');
    }
  }

  void confirmLogin(BuildContext context) async {
    var userData = await localStorageService.get(USER_BOX, USER_KEY);
    print(userData['email']);
    setEmail = userData['email'];
    login(context);
  }

  void getLoggedInUser() async {
    var userData = await localStorageService.get(USER_BOX, USER_KEY);
    print(userData['email']);
    setEmail = userData['email'];
    setUser = userData;
    setLoading = false;
  }

  LoginProvider() {
    getLoggedInUser();
  }
}
