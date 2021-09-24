import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rare_gem/frontend/screen/wallet/gold/balance.dart';
import 'package:rare_gem/frontend/screen/wallet/main/index.dart';
import 'package:rare_gem/frontend/screen/wallet/silver/balance.dart';
import 'package:rare_gem/frontend/widgets/button.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/src/models/entities/Wallet.dart';
import 'package:rare_gem/utils/constants/constants.dart';
import 'package:rare_gem/utils/constants/routes.dart';
import 'package:rare_gem/utils/styles/colors.dart';
import 'package:rare_gem/utils/styles/text.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

List<Wallet> wallets = [
  Wallet(name: 'Main', indicator: 'main', walletType: WalletType.Main),
  Wallet(name: 'Gold', indicator: 'gold', walletType: WalletType.Gold),
  Wallet(name: 'Silver', indicator: 'silver', walletType: WalletType.Silver),
];

class _WalletScreenState extends State<WalletScreen> {

  WalletType? walletType = wallets.first.walletType!;

  List<Wallet> walletToDisplay = [];

  reloadWalletList() {
    setState(() {
      // walletToDisplay = wallets;
      walletToDisplay = wallets.where((wallet) => wallet.walletType != walletType).toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reloadWalletList();
  }


  @override
  Widget build(BuildContext context) {
    // reloadWalletList();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (walletType == WalletType.Main)
            ...[
              MainWalletBalance(),
            ],
          if (walletType == WalletType.Gold)
            ...[
              GoldWalletBalance(),
            ],
          if (walletType == WalletType.Silver)
            ...[
              SilverWalletBalance(),
            ],

          ColumnSpace(30),
          Expanded(
            child: ListView.builder(
              itemCount: walletToDisplay.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap:  () => setState(() {
                    walletType = walletToDisplay[index].walletType;
                    reloadWalletList();
                  }),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                        color: Color(0xFFEFEFF4),
                        borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                            backgroundColor: primaryColor,
                            child: Icon(Icons.shopping_bag, color: Colors.white, size: 24,)
                        ),
                        RowSpace(16),
                        Expanded(
                          child: Text("${walletToDisplay[index].name!} Wallet", style: interTextStyle.copyWith(
                              fontSize: 17, fontWeight: FontWeight.w600
                          ),),
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_right, color: Color(0xFFC8C7CC), size: 24,),
                          onPressed: null,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}