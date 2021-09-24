import 'package:rare_gem/frontend/providers/auth/login_provider.dart';
import 'package:rare_gem/frontend/providers/auth/register_provider.dart';
import 'package:rare_gem/frontend/providers/auth/registration_provider.dart';
import 'package:rare_gem/frontend/providers/investment/create_investment_provider.dart';
import 'package:rare_gem/frontend/providers/investment/history_provider.dart';
import 'package:rare_gem/frontend/providers/settings/change_password_provider.dart';
import 'package:rare_gem/frontend/providers/wallet/transaction_provider.dart';
import 'package:rare_gem/frontend/screen/NavPage/nav_screen.dart';
import 'package:rare_gem/frontend/screen/auth/login_page.dart';
import 'package:rare_gem/frontend/screen/auth/password.dart';
import 'package:rare_gem/frontend/screen/auth/recover.dart';
import 'package:rare_gem/frontend/screen/auth/register.dart';
import 'package:rare_gem/frontend/screen/auth/registration/bank.dart';
import 'package:rare_gem/frontend/screen/auth/registration/next_of_kin.dart';
import 'package:rare_gem/frontend/screen/auth/registration/profile.dart';
import 'package:rare_gem/frontend/screen/auth/reset_password.dart';
import 'package:rare_gem/frontend/screen/auth/verify.dart';
import 'package:rare_gem/frontend/screen/dashboard.dart';
import 'package:rare_gem/frontend/screen/error/page_not_found.dart';
import 'package:rare_gem/frontend/screen/intro/intro_screen.dart';
import 'package:rare_gem/frontend/screen/investment/create_investment/checkout.dart';
import 'package:rare_gem/frontend/screen/investment/create_investment/create_investment.dart';
import 'package:rare_gem/frontend/screen/investment/history.dart';
import 'package:rare_gem/frontend/screen/investment/view_investment.dart';
import 'package:rare_gem/frontend/screen/onboading.dart';
import 'package:rare_gem/frontend/screen/settings/contact_us/contact_us.dart';
import 'package:rare_gem/frontend/screen/settings/knowledgeable/knowledgeable.dart';
import 'package:rare_gem/frontend/screen/settings/profile/address.dart';
import 'package:rare_gem/frontend/screen/settings/profile/bank.dart';
import 'package:rare_gem/frontend/screen/settings/profile/identity.dart';
import 'package:rare_gem/frontend/screen/settings/profile/next_of_kin.dart';
import 'package:rare_gem/frontend/screen/settings/profile/personal_information.dart';
import 'package:rare_gem/frontend/screen/settings/profile/profile.dart';
import 'package:rare_gem/frontend/screen/settings/security/change_password.dart';
import 'package:rare_gem/frontend/screen/settings/security/security.dart';
import 'package:rare_gem/frontend/screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rare_gem/frontend/screen/success.dart';
import 'package:rare_gem/frontend/screen/wallet/main/add_fund/amount_to_fund.dart';
import 'package:rare_gem/frontend/screen/wallet/main/add_fund/select_payment_method.dart';
import 'package:rare_gem/frontend/screen/wallet/main/add_fund/summary.dart';
import 'package:rare_gem/frontend/screen/wallet/main/withdraw_fund/amount_to_withdraw.dart';
import 'package:rare_gem/frontend/screen/wallet/main/withdraw_fund/summary.dart';
import 'package:rare_gem/frontend/screen/wallet/transaction/history.dart';
import 'package:rare_gem/frontend/screen/wallet/transaction/view_transaction.dart';
import 'package:rare_gem/src/models/entities/Investment.dart';
import 'package:rare_gem/utils/constants/routes.dart';
import 'package:rare_gem/frontend/screen/settings/settings.dart';

class RouteGenerator {
  static onRouteGenerate(RouteSettings settings) {
    var name = settings.name;
    var argument = settings.arguments;

    switch (name) {
      case INITIAL_PAGE_ROUTE:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case HOME_PAGE_ROUTE:
        return MaterialPageRoute(builder: (context) => Dashboard());
      case INTRO_PAGE_ROUTE:
        return MaterialPageRoute(builder: (context) => IntroScreen());
      case ON_BOARD_PAGE_ROUTE:
        return MaterialPageRoute(builder: (context) => OnBoardingScreen());

      case SUCCESS_MESSAGE:
        return MaterialPageRoute(builder: (context) => SucessMessage());

      case LOGIN_PAGE_ROUTE:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) => LoginProvider(),
                  child: LoginPage(),
                ));
      case REGISTER_PAGE_ROUTE:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) => RegisterProvider(),
                  child: RegisterPage(),
                ));
      case VERIFY_ACCOUNT_PAGE_ROUTE:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) => LoginProvider(),
                  child: VerifyAccountPage(),
                ));
      case ALREADY_LOGGEDIN_PAGE_ROUTE:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) => LoginProvider(),
                  child: AlreadyLoggedIn(),
                ));
      case RECOVER_PASSWORD_PAGE_ROUTE:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) => LoginProvider(),
                  child: RecoverPasswordPage(),
                ));
      case PROFILE_REGISTRATION_ROUTE:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) => ProfileRegistrationProvider(),
                  child: ProfileRegistrationPage(),
                ));
      case NEXT_OF_KIN_REGISTRATION_ROUTE:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) => LoginProvider(),
                  child: NextOfKinRegistrationPage(),
                ));
      case BANK_REGISTRATION_ROUTE:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) => LoginProvider(),
                  child: BankRegistrationPage(),
                ));
      case DASHBOARD_ROUTE:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) => LoginProvider(),
                  child: NavScreen(),
                ));
      case INVESTMENT_HISTORY_ROUTE:
        return MaterialPageRoute(
            builder: (context) => InvestmentHistoryScreen());
      case VIEW_INVESTMENT_ROUTE:
        return MaterialPageRoute(
            builder: (context) => ViewInvestment(
                  investmentId: argument as int,
                ));
      case CREATE_INVESTMENT_ROUTE:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) => CreateInvestmentProvider(),
                  child: CreateInvestmentScreen(),
                ));
      case CHECKOUT_INVESTMENT_ROUTE:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) => LoginProvider(),
                  child: CheckoutInvestmentScreen(),
                ));
      case ADD_FUND_SELECT_PAYMENT_METHOD_ROUTE:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) => LoginProvider(),
                  child: AddFundSelectPaymentMethodScreen(),
                ));
      case ADD_FUND_AMOUNT_TO_FUND_ROUTE:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) => LoginProvider(),
                  child: AddFundAmountToFund(),
                ));
      case ADD_FUND_SUMMARY_ROUTE:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) => LoginProvider(),
                  child: AddFundSummary(),
                ));
      case WITHDRAW_AMOUNT_WITHDRAW_ROUTE:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) => LoginProvider(),
                  child: WithdrawAmountToWithdraw(),
                ));
      case WITHDRAW_SUMMARY_ROUTE:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) => LoginProvider(),
                  child: WithdrawFundSummary(),
                ));
      case TRANSACTION_HISTORY_ROUTE:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) =>
                      TransactionHistoryProvider(argument! as String),
                  child: TransactionHistoryScreen(),
                ));
      case VIEW_TRANSACTION_ROUTE:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) => LoginProvider(),
                  child: ViewTransactionScreen(),
                ));
      case MY_PROFILE_ROUTE:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) => LoginProvider(),
                  child: MyProfileScreen(),
                ));
      case MY_PROFILE_PERSONAL_INFO_ROUTE:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) => LoginProvider(),
                  child: PersonalInfoScreen(),
                ));
      case MY_PROFILE_ADDRESS_ROUTE:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) => LoginProvider(),
                  child: MyProfileAddressScreen(),
                ));
      case MY_PROFILE_BANK_INFORMATION_ROUTE:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) => LoginProvider(),
                  child: MyProfileBankInfoScreen(),
                ));
      case MY_PROFILE_NEXT_OF_KIN_ROUTE:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) => LoginProvider(),
                  child: MyProfileNextOfKinScreen(),
                ));
      case MY_PROFILE_IDENTITY_ROUTE:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) => LoginProvider(),
                  child: MyProfileIdentityScreen(),
                ));
      case SETTINGS_SECURITY_ROUTE:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) => LoginProvider(),
                  child: Settings(),
                ));
      case SECURITY_CHANGE_PASSWORD_ROUTE:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) => ChangePasswordProvider(),
                  child: ChangePasswordScreen(),
                ));
      case SETTINGS_CONTACT_ROUTE:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) => LoginProvider(),
                  child: SettingContactScreen(),
                ));
      case SETTINGS_KNOWLEDGEABLE_ROUTE:
        return MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                  create: (context) => LoginProvider(),
                  child: SettingsKnowledgeableScreen(),
                ));

      default:
        return MaterialPageRoute(builder: (context) => PageNotFound());
    }
  }
}


///SucessMessage