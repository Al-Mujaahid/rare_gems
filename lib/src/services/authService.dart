import 'package:flutter/cupertino.dart';
import 'package:rare_gem/src/models/core/ServiceResponse.dart';
import 'package:rare_gem/src/services/apiServices.dart';
import 'package:rare_gem/utils/constants/end_points.dart';

class AuthService {
  ApiService? _apiService;

  static final _authService = AuthService.createInstance();

  AuthService.createInstance();

  factory AuthService(ApiService apiService) {
    _authService._apiService = apiService;
    return _authService;
  }
  // AuthService()
  Future<ServiceResponse> login({email, password}) async {
    var data = {'email': email, 'password': password};
    var response =
        await _apiService!.makePostRequest(LOGIN_ENDPOINT, data, null);
    return ServiceResponse.fromJSON(response.toJSON());
  }

  Future<ServiceResponse> register(
      {@required email,
      @required name,
      @required password,
      @required confirm_password}) async {
    var data = {
      'email': email,
      'name': name,
      'password': password,
      'confirm_password': confirm_password
    };
    var response =
        await _apiService!.makePostRequest(REGISTER_ENDPOINT, data, null);
    return ServiceResponse.fromJSON(response.toJSON());
  }

  Future<ServiceResponse> resendVerificationLink() async {
    var data = {'resend': 'resend'};
    var response =
        await _apiService!.makePostRequest(REGISTER_ENDPOINT, data, null);
    return ServiceResponse.fromJSON(response.toJSON());
  }

  Future<ServiceResponse> getAuthUser() async {
    var data = {'resend': 'resend'};
    var response =
        await _apiService!.makePostRequest(REGISTER_ENDPOINT, data, null);
    return ServiceResponse.fromJSON(response.toJSON());
  }

  Future<ServiceResponse> logout() async {
    var data = {'resend': 'resend'};
    var response =
        await _apiService!.makePostRequest(REGISTER_ENDPOINT, data, null);
    return ServiceResponse.fromJSON(response.toJSON());
  }

  Future<ServiceResponse> refreshToken() async {
    var data = {'resend': 'resend'};
    var response =
        await _apiService!.makePostRequest(REFRESH_TOKEN_ENDPOINT, data, null);
    return ServiceResponse.fromJSON(response.toJSON());
  }

  Future<ServiceResponse> resetPassword(
      {old_password, new_password, confirm_password}) async {
    var data = {
      'old_password': old_password,
      "new_password": new_password,
      "confirm_password": confirm_password,
    };
    var response = await _apiService!
        .makePostRequest(CHANGE_PASSWORD_ENDPOINT, data, null);
    return ServiceResponse.fromJSON(response.toJSON());
  }
}
