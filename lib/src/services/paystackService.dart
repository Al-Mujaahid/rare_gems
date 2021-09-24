

import 'dart:convert';

import 'package:rare_gem/src/models/core/ServiceResponse.dart';
import 'package:rare_gem/src/models/entities/Bank.dart';
import 'package:rare_gem/src/services/apiServices.dart';

class PaystackService {

  ApiService? _apiService;

  static final _payStackService = PaystackService.createInstance();
  PaystackService.createInstance();

  PaystackService(ApiService apiService) {
    _apiService = apiService;
  }


  Future<List<Bank>> getAllBanks() async {
    const url = "https://api.paystack.co/bank";
    var response = await _apiService!.makeGetRequest(url, {
      'Authorization': 'Bearer sk_live_9172e666c239c3557426fa2f1069c85fd85dc8ba'
    });
    if (response.status == true) {
      print(response.data['data'].runtimeType);
      return List.from(response.data['data']).map((e) => Bank.fromJson(e)).toList();
    } else {
      return <Bank>[];
    }
  }

  Future<ServiceResponse> verifyBankDetail(account_no, bank_code) async {
    var url = "https://api.paystack.co/bank/resolve?account_number=$account_no&bank_code=$bank_code";
    var response = await _apiService!.makeGetRequest(url, {
      'Authorization': 'Bearer sk_live_9172e666c239c3557426fa2f1069c85fd85dc8ba'
    });
    return ServiceResponse.fromJSON(response.toJSON());
  }


}