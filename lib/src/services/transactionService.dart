

import 'package:rare_gem/src/models/core/ServiceResponse.dart';
import 'package:rare_gem/src/services/apiServices.dart';
import 'package:rare_gem/utils/constants/end_points.dart';

class TransactionService {

  ApiService? _apiService;
  static final _transactionService = TransactionService.createInstance();
  TransactionService.createInstance();

  factory TransactionService(ApiService apiService) {
    _transactionService._apiService = apiService;
    return _transactionService;
  }

  Future<ServiceResponse> getTransactions(String type) async {
    var response = await _apiService!.makeGetRequest(TRANSACTIONS_ENDPOINT+'?type=$type', null);
    return ServiceResponse.fromJSON(response.toJSON());
  }

  Future<ServiceResponse> getTransaction(String id) async {
    var response = await _apiService!.makeGetRequest(TRANSACTIONS_ENDPOINT+'/$id/'+'show', null);
    return ServiceResponse.fromJSON(response.toJSON());
  }

  Future<ServiceResponse> getBalance() async {
    var response = await _apiService!.makePostRequest(BALANCE_ENDPOINT, {'me': 'me'}, null);
    return ServiceResponse.fromJSON(response.toJSON());
  }
}