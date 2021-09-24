import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rare_gem/frontend/providers/auth/registration_provider.dart';
import 'package:rare_gem/frontend/widgets/button.dart';
import 'package:rare_gem/frontend/widgets/coutnry_code.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/utils/constants/routes.dart';
import 'package:rare_gem/utils/styles/input.dart';
import 'package:rare_gem/utils/styles/text.dart';
import 'package:smart_select/smart_select.dart';

class ProfileRegistrationPage extends StatelessWidget {
  const ProfileRegistrationPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Welcome', style: GoogleFonts.inter(
          fontSize: 17, fontWeight: FontWeight.w600, color: Color(0xFF030303)
        ),),
        centerTitle: true, elevation: 0,
      ),
      body: Consumer<ProfileRegistrationProvider>(
        builder: (context, value, child) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ColumnSpace(16),
                  Text("Personal Info", style: sfProTextStyle.copyWith(
                      fontSize: 34, fontWeight: FontWeight.w700
                  )),
                  ColumnSpace(16),
                  Text("Please complete your personal information to continue", style: subtitleStyle,),
                  ColumnSpace(40.66),
                  CountryCodeWidget(
                    onSelect: (S2Choice choice) {
                      print(choice.meta);
                      value.user['phone_code'] = choice.meta['code'];
                      value.user['country'] = choice.meta['country'];
                      value.setUser = value.user;
                      print(value.user['country']);
                    },
                    selected: value.user['phone_code'],
                  ),
                  ColumnSpace(16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Phone", style: subtitleStyle),
                      ColumnSpace(4),
                      TextFormField(
                        decoration: underlineInputDecoration(filled: false, hintText: "Enter phone number"),
                        onChanged: (text) {
                          value.user['phone'] = text;
                          value.setUser = value.user;
                        },
                        keyboardType: TextInputType.number,
                      )
                    ],
                  ),

                  ColumnSpace(16),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("State", style: subtitleStyle),
                      ColumnSpace(4),
                      TextFormField(
                        decoration: underlineInputDecoration(filled: false, hintText: "Enter your state"),
                        onChanged: (text) {
                          value.user['state'] = text;
                          value.setUser = value.user;
                        },
                      )
                    ],
                  ),

                  ColumnSpace(16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("City", style: subtitleStyle),
                      ColumnSpace(4),
                      TextFormField(
                        decoration: underlineInputDecoration(filled: false, hintText: "Enter your city"),
                        onChanged: (text) {
                          value.user['city'] = text;
                          value.setUser = value.user;
                        },
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
                        decoration: underlineInputDecoration(filled: false, hintText: "Enter address"),
                        onChanged: (text) {
                          value.user['address'] = text;
                          value.setUser = value.user;
                        },
                      )
                    ],
                  ),

                  ColumnSpace(16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Profile picture", style: subtitleStyle),
                      ColumnSpace(4),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFF9F9F9),
                            border: Border.all(
                              color: Color(0xFFD8D8D8), width: 1
                            )
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: 170,
                        child: Center(child: Icon(Icons.camera, color: Color(0xFFDADADA), size: 40,)),
                      )
                    ],
                  ),

                  ColumnSpace(16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Valid Id", style: subtitleStyle),
                      ColumnSpace(4),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFF9F9F9),
                            border: Border.all(
                                color: Color(0xFFD8D8D8), width: 1
                            )
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: 170,
                        child: Center(child: Icon(Icons.camera, color: Color(0xFFDADADA),)),
                      )
                    ],
                  ),

                  ColumnSpace(20),
                  Row(
                    children: [
                      Expanded(
                          child: RareGemPrimaryButton(
                            child: Text("Submit and continue", style: GoogleFonts.inter(
                                color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600
                            )),
                            onClick: () => value.updateProfile(context),
                          )
                      )
                    ],
                  ),
                  ColumnSpace(23),
                  Container(
                    alignment: Alignment.center,
                    child: Text("Step 1 of 3"),
                  ),
                  ColumnSpace(35),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}