
import 'package:rare_gem/frontend/providers/base_provider.dart';
import 'package:rare_gem/src/models/entities/InvestmentPackage.dart';
import 'package:rare_gem/src/services/index.dart';

class CreateInvestmentProvider extends BaseProvider {

  static final _createInvestment = CreateInvestmentProvider.createInstance();
  CreateInvestmentProvider.createInstance();

  factory CreateInvestmentProvider() {
    _createInvestment.initialize();
    return _createInvestment;
  }

  List<InvestmentPackage> packages = [];
  InvestmentPackage? package;
  double slots = 0;
  double investmentAmount = 0;
  double roiAmount = 0;
  double expectedAmount = 0;
  double roi = 0;

  set setPackage(id) {
    package = packages.firstWhere((element) => element.id.toString() == id.toString());
    _doCalculations();
    notifyListeners();
  }

  set setSlots(String text) {
    slots = double.parse(text);
    _doCalculations();
    notifyListeners();
  }
  set setInvestmentAmount(double amt) {
    investmentAmount = amt;
    notifyListeners();
  }

  _doCalculations() {
    if (package != null) {
      investmentService.getInvestmentPackage(package!.id);
      setInvestmentAmount = package!.pricePerSlot! * slots;
      roiAmount = (package!.roi!/100) * investmentAmount;
      expectedAmount = investmentAmount + roiAmount;
      roi = package!.roi!;
      notifyListeners();
    }
  }


  void initialize() async {
    try {
      setLoading = true;
      var packageResponse = await investmentService.getInvestmentPackages();
      packages = List.from(packageResponse.data['data']).map((e) => InvestmentPackage.fromJson(e)).toList();
      package = packages.first;
      setLoading = false;
    } catch (error) {

    }
  }
}