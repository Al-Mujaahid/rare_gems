import 'package:rare_gem/src/services/AuthService.dart';
import 'package:rare_gem/src/services/apiServices.dart';
import 'package:rare_gem/src/services/countryCodeService.dart';
import 'package:rare_gem/src/services/investmentService.dart';
import 'package:rare_gem/src/services/localStorageService.dart';
import 'package:rare_gem/src/services/paystackService.dart';
import 'package:rare_gem/src/services/profileService.dart';
import 'package:rare_gem/src/services/tradeService.dart';
import 'package:rare_gem/src/services/transactionService.dart';

ApiService apiService = ApiService();
LocalStorageService localStorageService = LocalStorageService();
CountryCodeService countryCodeService = CountryCodeService();

AuthService authService = AuthService(apiService);
ProfileService profileService = ProfileService(apiService);
TransactionService transactionService = TransactionService(apiService);
PaystackService paystackService = PaystackService(apiService);
TradeService tradeService = TradeService(apiService);
InvestmentService investmentService = InvestmentService(apiService);
