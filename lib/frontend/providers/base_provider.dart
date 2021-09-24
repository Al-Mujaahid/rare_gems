import 'package:flutter/cupertino.dart';

class BaseProvider extends ChangeNotifier {
  bool _loading = false;
  BuildContext? _context;

  bool get loading => _loading;
  BuildContext get ctx => _context!;

  set setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  set setBuildContext(BuildContext context) {
    _context = context;
  }

  void closeAlert(BuildContext ctx) {
    Navigator.pop(ctx);
  }
}
