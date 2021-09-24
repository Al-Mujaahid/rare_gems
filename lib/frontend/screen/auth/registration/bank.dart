import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rare_gem/frontend/widgets/button.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/utils/constants/routes.dart';
import 'package:rare_gem/utils/styles/input.dart';
import 'package:rare_gem/utils/styles/text.dart';
import 'package:smart_select/smart_select.dart';

class BankRegistrationPage extends StatelessWidget {
  const BankRegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Personal Information', style: subtitleStyle.copyWith(
          color: Colors.black, fontWeight: FontWeight.w600
        ),),
        centerTitle: true,
        elevation: 0, leading: InkWell(
          child: Icon(Icons.arrow_back_ios, color: Colors.black,),
          onTap: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ColumnSpace(26),
                  Text('Bank Info', style: GoogleFonts.inter(
                    fontSize: 34, fontWeight: FontWeight.w700
                  ),),
                  ColumnSpace(16),
                  Text('Please complete your Bank information to continue', style: subtitleStyle,),
                  ColumnSpace(40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("City", style: subtitleStyle),
                      SmartSelect.single(
                        title: "Select bank",
                        value: '...',
                        onChange: (value) => print(value.value),
                        modalType: S2ModalType.fullPage,
                        modalFilter: true,
                        choiceItems: [],
                      ),
                    ],
                  ),
                  ColumnSpace(16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Account Number", style: subtitleStyle),
                      ColumnSpace(4),
                      TextFormField(
                        decoration: underlineInputDecoration(filled: false, hintText: "Enter account number"),
                      )
                    ],
                  ),

                  ColumnSpace(16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Account Holder", style: subtitleStyle),
                      ColumnSpace(4),
                      TextFormField(
                        decoration: underlineInputDecoration(filled: false, hintText: "Enter account name"),
                      )
                    ],
                  ),

                ],
              ),
            ),
            ColumnSpace(20),
            Row(
              children: [
                Expanded(
                    child: RareGemPrimaryButton(
                      child: Text("Submit and continue", style: GoogleFonts.inter(
                          color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600
                      )),
                      onClick: () => Navigator.of(context).pushNamed(NEXT_OF_KIN_REGISTRATION_ROUTE),
                    )
                )
              ],
            ),
            ColumnSpace(23),
            Container(
              alignment: Alignment.center,
              child: Text("Step 2 of 3"),
            ),
            ColumnSpace(35),
          ],
        ),
      ),
    );
  }
}
