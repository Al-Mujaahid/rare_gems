

import 'package:rare_gem/frontend/providers/base_provider.dart';
import 'package:rare_gem/src/models/entities/Investment.dart';
import 'package:rare_gem/src/services/index.dart';

class InvestmentHistoryProvider extends BaseProvider {

  static final _investmentHistory = InvestmentHistoryProvider.createInstance();
  InvestmentHistoryProvider.createInstance();

  List<Investment> investmentHistory = [];
  String status = '';

  factory InvestmentHistoryProvider() {
    _investmentHistory.loadHistory('');
    return _investmentHistory;
  }
  void loadHistory(sts) async {
    try {
      status = sts;
      setLoading = true;
      var invRes = await investmentService.getInvestments(status: status);
      investmentHistory = List.from(invRes.data['data']).map((e) => Investment.fromJson(e)).toList();
      setLoading = false;
    } catch (error) {

    }
  }
}