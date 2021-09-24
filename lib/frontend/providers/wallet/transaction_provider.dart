import 'package:rare_gem/frontend/helper/interaction.dart';
import 'package:rare_gem/frontend/providers/base_provider.dart';
import 'package:rare_gem/src/models/entities/Transaction.dart';
import 'package:rare_gem/src/services/index.dart';

class TransactionHistoryProvider extends BaseProvider {
  
  String _type = 'withdrawal';
  String get type => _type;
  List<Transaction> transactions = [];

  set setHistoryType(String type) {
    _type = type;
    notifyListeners();
  }

  TransactionHistoryProvider(type) {
    setHistoryType = type;
    initialize();
  }

  void initialize() async {
    try {
      setLoading = true;
      // Get Transactions
      var transactionResponse = await transactionService.getTransactions('withdrawal');
      transactions = List.from(transactionResponse.data['data']).map((e) => Transaction.fromJson(e)).toList();
      setLoading = false;
    } catch (error) {
      setLoading = false;
      MessageAlert.showErrorAlert(ctx, 'Error: $error');
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}