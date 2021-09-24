

import 'package:rare_gem/src/models/core/ServiceResponse.dart';
import 'package:rare_gem/src/services/apiServices.dart';
import 'package:rare_gem/utils/constants/end_points.dart';

class InvestmentService {

  ApiService? _apiService;

  static final _investmentService = InvestmentService.createInstance();
  InvestmentService.createInstance();

  factory InvestmentService(ApiService apiService) {
    _investmentService._apiService = apiService;
    return _investmentService;
  }

  Future<ServiceResponse> getInvestments({status}) async {
    var response = await _apiService!.makeGetRequest(INVESTMENTS_ENDPOINT+'?status=$status', null);
    return ServiceResponse.fromJSON(response.toJSON());
  }

  Future<ServiceResponse> getInvestment({id}) async {
    var response = await _apiService!.makeGetRequest(INVESTMENTS_ENDPOINT+'/$id/show', null);
    return ServiceResponse.fromJSON(response.toJSON());
  }

  Future<ServiceResponse> getInvestmentPackages() async {
    var response = await _apiService!.makeGetRequest(INVESTMENTS_PACKAGES_ENDPOINT, null);
    return ServiceResponse.fromJSON(response.toJSON());
  }

  Future<ServiceResponse> getInvestmentPackage(id) async {
    var response = await _apiService!.makeGetRequest(INVESTMENTS_PACKAGES_ENDPOINT+'/$id/show', null);
    return ServiceResponse.fromJSON(response.toJSON());
  }
}