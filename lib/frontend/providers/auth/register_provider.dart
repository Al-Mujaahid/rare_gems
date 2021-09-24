import 'package:rare_gem/frontend/helper/interaction.dart';
import 'package:rare_gem/frontend/providers/base_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:rare_gem/src/services/index.dart';
import 'package:rare_gem/utils/constants/constants.dart';
import 'package:rare_gem/utils/constants/routes.dart';

class RegisterProvider extends BaseProvider {
  String? _email;
  String? _name;
  String? _password;
  String? _confirm_password;
  bool formValid = false;
  bool agreedToTerms = false;

  String get email => _email ?? '';
  String get password => _password ?? '';
  String get confirmPassword => _confirm_password ?? '';

  set setEmail(String email) {
    _email = email;
    checkFormIsValid();
    notifyListeners();
  }

  set setAgreedToTerm(bool terms) {
    agreedToTerms = terms;
    checkFormIsValid();
    notifyListeners();
  }

  set setName(String name) {
    _name = name;
    checkFormIsValid();
    notifyListeners();
  }

  set setConfirmPassword(String pass) {
    _confirm_password = pass;
    checkFormIsValid();
    notifyListeners();
  }

  set setPassword(String password) {
    _password = password;
    checkFormIsValid();
    notifyListeners();
  }

  void checkFormIsValid() {
    if (((_password != null) &&
            (_email != null) &&
            (_name != null) &&
            (_confirm_password != null)) &&
        ((_password!.length >= 8) &&
            (_email!.length > 0) &&
            (_name!.length >= 3) &&
            (_confirm_password!.length > 0)) &&
        (_password == _confirm_password) &&
        (agreedToTerms)) {
      formValid = true;
    } else {
      formValid = false;
    }
    notifyListeners();
  }

  void register(BuildContext context) async {
    try {
      print("Hope no problem!");
      MessageAlert.showLoadingAlert(context, 'Registration in progress...');
      FocusScope.of(context).unfocus();
      setLoading = true;

      var response = await authService.register(
          email: _email,
          password: _password,
          confirm_password: _confirm_password,
          name: _name);
      closeAlert(context);

      if (response.status == true) {
        print('Done');
        localStorageService.set(USER_BOX, USER_KEY, response.data['data']);
        localStorageService.set(
            USER_BOX, TOKEN_KEY, response.data['access_token']);
        MessageAlert.showAlert(context, "Registration successful", onClick: () {
          Navigator.pushNamedAndRemoveUntil(
              context, PROFILE_REGISTRATION_ROUTE, (route) => false);
        });
      } else {
        print(response.message);
        MessageAlert.showErrorAlert(context, response.message!);
      }
      setLoading = false;
    } catch (error) {
      setLoading = false;
      closeAlert(context);
      MessageAlert.showErrorAlert(context, 'Error: $error');
      rethrow;
    }
  }
}
