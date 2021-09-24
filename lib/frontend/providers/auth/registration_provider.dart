import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:rare_gem/frontend/helper/interaction.dart';
import 'package:rare_gem/frontend/providers/base_provider.dart';
import 'package:rare_gem/src/helpers/textHelper.dart';
import 'package:rare_gem/src/services/index.dart';
import 'package:rare_gem/utils/constants/constants.dart';

class ProfileRegistrationProvider extends BaseProvider {
  var _user = {};
  File? id;
  File? profileIMage;
  String? bank_code;

  bool profileFormIsValid = false;
  bool bankFormIsValid = false;
  bool nextOfKinFormIsValid = false;

  static final ProfileRegistrationProvider _profileRegistrationProvider =
      ProfileRegistrationProvider.createInstance();
  ProfileRegistrationProvider.createInstance();

  ProfileRegistrationProvider() {
    initialize();
  }

  get user => _user;

  set setUser(user) {
    _user = user;
  }

  setBankCode(code, BuildContext context) {
    bank_code = code;
    bankFormIsValid = false;
    notifyListeners();
  }

  void selectProfilePicture(BuildContext context) async {
    var pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg'],
      allowMultiple: false,
    );
    if (pickedFile != null) {
      profileIMage = File(pickedFile.files.first.path!);
      notifyListeners();
    }
  }

  void selectValidId(BuildContext context) {}

  void initialize() async {
    try {
      setUser = await localStorageService.get(USER_BOX, USER_KEY);
      setLoading = false;
    } catch (error) {}
  }

  void updateProfile(BuildContext context) async {
    if (isNull(_user['phone']) ||
        isNull(_user['address']) ||
        isNull(_user['city']) ||
        isNull(_user['country']) ||
        isNull(_user['state'])) {
      MessageAlert.showErrorAlert(context, 'All fields are required');
    } else {
      // MessageAlert.showAlert(context, 'Form Is Valid');
      try {
        MessageAlert.showLoadingAlert(context, 'Updating profile...');
        user['nk_name'] = user['next_of_kin_name'];
        user['nk_phone'] = user['next_of_kin_phone'];
        user['nk_address'] = user['next_of_kin_address'];
        var serviceResponse = await profileService.updateAllProfile(user);
        closeAlert(context);
        print(serviceResponse.toJSON());
        if (serviceResponse.status == true) {
          MessageAlert.showAlert(context, serviceResponse.message ?? '');
        } else {
          MessageAlert.showErrorAlert(context, serviceResponse.message ?? '');
        }
      } catch (error) {
        closeAlert(context);
        MessageAlert.showErrorAlert(context, "Error: $error");
        rethrow;
      }
    }
  }

  setAccountNo(acctNo, BuildContext context) {
    user['account_number'] = acctNo;
    verifyBankDetail(context);
  }

  void verifyBankDetail(BuildContext context) async {
    if (lengthEquals(user['account_number'], 10) && !isNull(bank_code)) {
      try {
        MessageAlert.showLoadingAlert(context, 'Verifying bank detail...');
        var response = await paystackService.verifyBankDetail(
            user['account_number'], bank_code);
        closeAlert(context);
        if (response.status == true) {
          print(response.data);
          user['account_name'] = response.data['data']['account_name'];
          user['account_number'] = response.data['data']['account_number'];
          bankFormIsValid = true;
          setUser = user;
          notifyListeners();
        } else {
          MessageAlert.showErrorAlert(context, response.message ?? '');
        }
      } catch (error) {
        bankFormIsValid = false;
      }
    }
  }
}
