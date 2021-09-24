import 'package:rare_gem/frontend/providers/base_provider.dart';
import 'package:rare_gem/frontend/helper/interaction.dart'; //contains the alert dialog to give nitification
import 'package:rare_gem/frontend/providers/base_provider.dart'; //the base of our provider
import 'package:flutter/cupertino.dart'; //contains access to ios desing pattern
import 'package:rare_gem/src/services/index.dart'; // connects access to each API services + auth API Service
import 'package:rare_gem/utils/constants/constants.dart'; // Constants like months--money_format--hive--others
import 'package:rare_gem/utils/constants/routes.dart';


class ChangePasswordProvider extends BaseProvider {

  String? oldPassword;
  String? newPassword;
  String? confirmPassword;
  bool _passwordVisible = false;
  bool formValid = false;

  bool get passwordIsVisible => _passwordVisible;
  String get _oldPassword => oldPassword ?? '';
  String get _newPassword => newPassword ?? '';
  String get _confirmPassword => confirmPassword ?? '';

  set setOldPassword(String _oldPassword) {
    oldPassword = _oldPassword;
    checkFormIsValid();
    notifyListeners();
  }

  set setNewPassword(String _newPassword) {
    newPassword = _newPassword;
    checkFormIsValid();
    notifyListeners();
  }

  set setConfirmPassword(String _confirmPassword) {
    confirmPassword = _confirmPassword;
    checkFormIsValid();
    notifyListeners();
  }


  void checkFormIsValid() {
    if (((oldPassword != null) && (newPassword != null) && (confirmPassword != null)) &&
        (oldPassword!.length >= 8) && (newPassword!.length >= 8) && (confirmPassword!.length >= 8)) {
      formValid = true;
    } else {
      formValid = false;
    }
    notifyListeners();
  }


  void togglePasswordIsVisible() {
    _passwordVisible = !_passwordVisible;
    notifyListeners();
  }

  //ChangePasswordProvider();

  void resetPassword(BuildContext context) async {
    try {

      if (oldPassword == null || newPassword == null || newPassword == null) {
        MessageAlert.showErrorAlert(context, 'All fields are required');
    } 

    else {
      MessageAlert.showLoadingAlert(context, 'Processing password change...');
      FocusScope.of(context).unfocus();
        setLoading = true;

      var response =
            await authService.resetPassword(old_password: oldPassword, new_password: newPassword, confirm_password: confirmPassword);
        closeAlert(context);

        if (response.status == true) {
      MessageAlert.showAlert(context, "Successfully changed password",
              onClick: () {
            Navigator.pushNamedAndRemoveUntil(
                  context, DASHBOARD_ROUTE, (route) => false);
          });}
          else {
          print(response.message);
          MessageAlert.showErrorAlert(context, response.message!);
          closeAlert(context);
          Navigator.pushNamedAndRemoveUntil(
                  context, LOGIN_PAGE_ROUTE, (route) => false);
        }
        setLoading = false;
    
    }

    
    }
    catch (error) {
      setLoading = false;
      closeAlert(context);
      MessageAlert.showErrorAlert(context, 'Error! $error');

    }
  
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  // }


  ChangePasswordProvider();
}
}