import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rare_gem/frontend/providers/settings/profile_provider.dart';
import 'package:rare_gem/frontend/widgets/BankListWidget.dart';
import 'package:rare_gem/frontend/widgets/button.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:smart_select/smart_select.dart';

class MyProfileBankInfoScreen extends StatefulWidget {
  const MyProfileBankInfoScreen({Key? key}) : super(key: key);

  @override
  _MyProfileBankInfoScreenState createState() => _MyProfileBankInfoScreenState();
}

class _MyProfileBankInfoScreenState extends State<MyProfileBankInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                ColumnSpace(25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context) ,
                        child: Icon(Icons.arrow_back_ios, color: Colors.black, size: 24,),
                      ),
                    ],
                  ),
                ),
                ColumnSpace(21),
                Divider(),
                Expanded(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(25, 15, 25, 0),
                      child: Consumer<ProfileProvider>(
                        builder: (context, value, child) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Bank Information",
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 34, fontWeight: FontWeight.w700)),
                              ),
                              Text(
                                "Update your Bank Information. Please ensure to use your accurate information as your funds will be paid into this account",
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff666666))),
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 30)),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Select Bank",
                                      style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff8A8A8F))),
                                    ),
                                    BankListWidget(
                                      selected: "${value.user['bank_name']}",
                                      onSelect: (S2Choice choice) {
                                        value.setBankCode(choice.meta['code'], context);
                                        value.user['bank_name'] = choice.meta['name'];
                                        value.setUser = value.user;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 30)),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Account Number",
                                      style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff8A8A8F))),
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.number,
                                      initialValue: "${value.user['account_number']}",
                                      onChanged: (acctNo) => value.setAccountNo(acctNo, context),
                                    )
                                  ],
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 30)),
                              Text(
                                "${value.user['account_name']}",
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff000000))),
                              ),
                            ],
                          );
                        },
                      )
                  ),
                ),
                ColumnSpace(120),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Consumer<ProfileProvider>(
                    builder: (context, value, child) {
                      return RareGemPrimaryButton(
                        child: Text(
                          "Submit",
                          style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffFFFFFF))),
                        ), onClick: value.bankFormIsValid ? () => value.updateProfile(context) : null,
                      );
                    },
                  ),
                ),
                ColumnSpace(40)
              ],
            ),
          ),
        ));
  }
}