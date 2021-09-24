

import 'package:rare_gem/frontend/providers/base_provider.dart';
import 'package:rare_gem/src/services/index.dart';

class DashboardProvider extends BaseProvider {

  static final _dashboardProvider = DashboardProvider.createInstance();
  DashboardProvider.createInstance();

  double activeInvestment = 0;
  double totalInvestment = 0;
  double totalTrade = 0;
  double paidInvestment = 0;

  factory DashboardProvider() {
    _dashboardProvider.initialize();
    return _dashboardProvider;
  }

  void initialize() async {
    try {
      setLoading = true;
      // transactionService.getTransactions('others');
      var actSumRes = await profileService.getActivitySummary();

      activeInvestment = double.tryParse(actSumRes.data['data']['active_investments']) ?? 0;
      totalInvestment = double.tryParse(actSumRes.data['data']['total_investments']) ?? 0;
      totalTrade = double.tryParse(actSumRes.data['data']['total_trades_ngn']) ?? 0;
      paidInvestment = double.tryParse(actSumRes.data['data']['paidInvestment']['regular_format']) ?? 0;

      setLoading = false;
    } catch (error) {
      setLoading = false;
      // MessageAlert
    }
  }
}