
import 'package:rare_gem/src/models/core/ServiceResponse.dart';
import 'package:rare_gem/src/services/apiServices.dart';
import 'package:rare_gem/utils/constants/end_points.dart';

class ProfileService {
  ApiService? _apiService;

  static final _profileService = ProfileService.createInstance();
  ProfileService.createInstance();

  factory ProfileService(ApiService apiService) {
    _profileService._apiService = apiService;
    return _profileService;
  }

  Future<ServiceResponse> updateProfile({name, country, city, state, address, phone, phone_code}) async {
    var data = {
      'name': name, 'city': city, 'state': state, 'address': address, 'phone': phone, 'phone_code': phone_code
    };
    var response = await _apiService!.makePostRequest(UPDATE_PROFILE_ENDPOINT, data, null);
    return ServiceResponse.fromJSON(response.toJSON());
  }

  Future<ServiceResponse> updateAllProfile(userProfile) async {
    var data = userProfile;
    var response = await _apiService!.makePostRequest(UPDATE_PROFILE_ENDPOINT, data, null);
    return ServiceResponse.fromJSON(response.toJSON());
  }

  Future<ServiceResponse> updateBank({bank_name, account_name, account_number}) async {
    var data = {
      'bank_name':bank_name, 'account_name':account_name, 'account_number':account_number
    };
    var response = await _apiService!.makePostRequest(UPDATE_PROFILE_ENDPOINT, data, null);
    return ServiceResponse.fromJSON(response.toJSON());
  }

  Future<ServiceResponse> updateNextOfKin({nk_name, nk_phone, nk_address}) async {
    var data = {
      'nk_name': nk_name, 'nk_phone': nk_phone, 'nk_address': nk_address
    };
    var response = await _apiService!.makePostRequest(UPDATE_PROFILE_ENDPOINT, data, null);
    return ServiceResponse.fromJSON(response.toJSON());
  }

  Future<ServiceResponse> getActivitySummary() async {
    var response = await _apiService!.makeGetRequest(ACTIVITY_SUMMARY_ENDPOINT, null);
    return ServiceResponse.fromJSON(response.toJSON());
  }

  Future<ServiceResponse> changePassword(oldPassword, newPassword, confirmPassword) async {
    var data = {
      'old_password': oldPassword, 'new_password': newPassword, 'confirm_password': confirmPassword
    };
    var response = await _apiService!.makePostRequest(CHANGE_PASSWORD_ENDPOINT, data, null);
    return ServiceResponse.fromJSON(response.toJSON());
  }

  
}