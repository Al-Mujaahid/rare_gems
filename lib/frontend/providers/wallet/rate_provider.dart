

import 'package:rare_gem/frontend/providers/base_provider.dart';
import 'package:rare_gem/src/models/entities/Rate.dart';
import 'package:rare_gem/src/services/index.dart';

class RateProvider extends BaseProvider {

  static final _dashboardProvider = RateProvider.createInstance();
  RateProvider.createInstance();

  Rate goldRate = Rate(buy: 0, sell: 0);
  Rate silverRate = Rate(buy: 0, sell: 0);

  factory RateProvider() {
    _dashboardProvider.initialize();
    return _dashboardProvider;
  }

  void initialize() async {
    try {
      setLoading = true;
      var rateResponse = await tradeService.getRate();

      print(rateResponse.data);

      goldRate = Rate.fromJson(rateResponse.data['data']['gold']);
      silverRate = Rate.fromJson(rateResponse.data['data']['silver']);

      notifyListeners();
      setLoading = false;
    } catch (error) {
      setLoading = false;
      // MessageAlert
    }
  }
}