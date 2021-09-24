class Wallet {
  String? name;
  String? indicator;
  WalletType? walletType;

  Wallet({this.name, this.indicator, this.walletType});
}

enum WalletType {Main, Gold, Silver}