

import 'package:rare_gem/frontend/providers/base_provider.dart';
import 'package:rare_gem/src/models/entities/Rate.dart';
import 'package:rare_gem/src/services/index.dart';

class BalanceProvider extends BaseProvider {

  static final _dashboardProvider = BalanceProvider.createInstance();
  BalanceProvider.createInstance();

  double nairaBalance = 0;
  double goldBalance = 0;
  double silverBalance = 0;

  factory BalanceProvider() {
    _dashboardProvider.initialize();
    return _dashboardProvider;
  }

  void initialize() async {
    try {
      setLoading = true;
      var response = await transactionService.getBalance();

      print(response.data);

      nairaBalance = double.tryParse(response.data['data']['naira'].toString()) ?? 0.0;
      goldBalance = double.tryParse(response.data['data']['gold'].toString()) ?? 0.0;
      silverBalance = double.tryParse(response.data['data']['silver'].toString()) ?? 0.0;

      notifyListeners();
      setLoading = false;
    } catch (error) {
      setLoading = false;
      // MessageAlert
    }
  }
}