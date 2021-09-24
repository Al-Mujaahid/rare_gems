import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rare_gem/frontend/providers/settings/profile_provider.dart';
import 'package:rare_gem/frontend/widgets/button.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/utils/styles/input.dart';
import 'package:rare_gem/utils/styles/text.dart';
import 'package:rare_gem/utils/styles/text.dart';
import 'package:rare_gem/utils/styles/text.dart';
import 'package:rare_gem/utils/styles/text.dart';
import 'package:rare_gem/utils/styles/text.dart';
// /import 'package:get/get.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({Key? key}) : super(key: key);

  @override
  _PersonalInfoScreenState createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
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
                                "Personal Information",
                                style: interTextStyle.copyWith(
                                  fontSize: 34, fontWeight: FontWeight.w700
                                ),
                              ),
                              Text(
                                "Update your personal information details",
                                style: interTextStyle.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff666666)
                                ),
                              ),
                              ColumnSpace(30),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Name",
                                      style: interTextStyle.copyWith(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff8A8A8F)
                                      ),
                                    ),
                                    TextFormField(
                                      initialValue: "${value.user['name']}",
                                      keyboardType: TextInputType.text,
                                      decoration: underlineInputDecoration(),
                                      onChanged: (text) {
                                        value.user['name'] = text;
                                        value.setUser = value.user;
                                      },
                                    )
                                  ],
                                ),
                              ),
                              ColumnSpace(30),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Email",
                                      style: interTextStyle.copyWith(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff8A8A8F)
                                      ),
                                    ),
                                    TextFormField(
                                      initialValue: "${value.user['email']}",
                                      keyboardType: TextInputType.emailAddress,
                                      onChanged: (text) {
                                        value.user['email'] = text;
                                        value.setUser = value.user;
                                      },
                                    )
                                  ],
                                ),
                              ),
                              ColumnSpace(30),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Phone",
                                      style: interTextStyle.copyWith(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff8A8A8F)
                                      ),
                                    ),
                                    TextFormField(
                                      initialValue: "${value.user['phone']}",
                                      keyboardType: TextInputType.number,
                                      onChanged: (text) {
                                        value.user['phone'] = text;
                                        value.setUser = value.user;
                                      },
                                    )
                                  ],
                                ),
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
                  child: RareGemPrimaryButton(
                    child: Text(
                      "Submit",
                      style: interTextStyle.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffFFFFFF)
                      ),
                    ),
                    onClick: () => Provider.of<ProfileProvider>(context, listen: false).updateProfile(context),
                  ),
                ),
                ColumnSpace(40)
              ],
            ),
          ),
        )
    );
  }
}