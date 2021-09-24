import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rare_gem/frontend/widgets/button.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/utils/constants/routes.dart';
import 'package:rare_gem/utils/styles/input.dart';
import 'package:rare_gem/utils/styles/text.dart';

class NextOfKinRegistrationPage extends StatelessWidget {
  const NextOfKinRegistrationPage({Key? key}) : super(key: key);

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
        elevation: 0,
        leading: InkWell(
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
                  Text('Next of Kin Info', style: GoogleFonts.inter(
                      fontSize: 34, fontWeight: FontWeight.w700
                  ),),
                  ColumnSpace(16),
                  Text('Please complete your next of kin information to continue', style: subtitleStyle,),
                  ColumnSpace(40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Full Name", style: subtitleStyle),
                      ColumnSpace(4),
                      TextFormField(
                        decoration: underlineInputDecoration(filled: false, hintText: "Enter next of kin full name"),
                      )
                    ],
                  ),
                  ColumnSpace(16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Phone", style: subtitleStyle),
                      ColumnSpace(4),
                      TextFormField(
                        decoration: underlineInputDecoration(filled: false, hintText: "Enter next of kin phone number"),
                      )
                    ],
                  ),

                  ColumnSpace(16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Address", style: subtitleStyle),
                      ColumnSpace(4),
                      TextFormField(
                        decoration: underlineInputDecoration(filled: false, hintText: "Enter next of kin address"),
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
                    child: Text("Submit and continue",
                      style: GoogleFonts.inter(
                        color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600
                      )
                    ),
                    onClick: () => Navigator.of(context).pushNamedAndRemoveUntil(DASHBOARD_ROUTE, (route) => false),
                  )
                )
              ],
            ),
            ColumnSpace(23),
            Container(
              alignment: Alignment.center,
              child: Text("Step 3 of 3"),
            ),
            ColumnSpace(35),
          ],
        ),
      ),
    );
  }
}
