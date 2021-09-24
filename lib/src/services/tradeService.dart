
import 'package:rare_gem/src/models/core/ServiceResponse.dart';
import 'package:rare_gem/src/services/apiServices.dart';
import 'package:rare_gem/utils/constants/end_points.dart';

class TradeService {

  ApiService? _apiService;

  static final _tradeService = TradeService.createInstance();
  TradeService.createInstance();

  factory TradeService(ApiService apiService) {
    _tradeService._apiService = apiService;
    return _tradeService;
  }

  Future<ServiceResponse> getRate() async {
    var response = await _apiService!.makeGetRequest(RATES_ENDPOINT, null);
    return ServiceResponse.fromJSON(response.toJSON());
  }
}