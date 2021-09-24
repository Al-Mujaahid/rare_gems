

import 'package:rare_gem/frontend/helper/interaction.dart';
import 'package:rare_gem/frontend/providers/base_provider.dart';
import 'package:rare_gem/src/models/entities/Investment.dart';
import 'package:rare_gem/src/services/index.dart';

class InvestmentProvider extends BaseProvider {

  static final _investmentProvider = InvestmentProvider.createInstance();
  InvestmentProvider.createInstance();

  List<Investment> investments = [];
  List<Investment> activeInvestments = [];

  factory InvestmentProvider() {
    _investmentProvider.initialize();
    return _investmentProvider;
  }

  void initialize() async {
    try {
      setLoading = true;
      var invResponse = await investmentService.getInvestments(status: 'active');
      investments = List.from(invResponse.data['data']).map((e) => Investment.fromJson(e)).toList();
      activeInvestments = investments.where((element) => element.status == 'active').toList();
      // invResponse
      setLoading = false;
    } catch (error) {
      setLoading = false;
      // MessageAlert.showErrorAlert(context, 'Error')
    }
  }
}