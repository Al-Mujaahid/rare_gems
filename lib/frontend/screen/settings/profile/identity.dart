import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rare_gem/frontend/providers/settings/profile_provider.dart';
import 'package:rare_gem/frontend/widgets/button.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/utils/styles/text.dart';
// /import 'package:get/get.dart';

class MyProfileIdentityScreen extends StatefulWidget {
  const MyProfileIdentityScreen({Key? key}) : super(key: key);

  @override
  _MyProfileIdentityScreenState createState() => _MyProfileIdentityScreenState();
}

class _MyProfileIdentityScreenState extends State<MyProfileIdentityScreen> {
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
                                "Identity",
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 34, fontWeight: FontWeight.w700)),
                              ),
                              Text(
                                "Update your diaplay picture and valid identification",
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff666666))),
                              ),
                              ColumnSpace(30),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Profile picture", style: subtitleStyle),
                                  ColumnSpace(4),
                                  InkWell(
                                    onTap: () => value.selectProfilePicture(context),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xFFF9F9F9),
                                          border: Border.all(
                                              color: Color(0xFFD8D8D8), width: 1
                                          )
                                      ),
                                      width: MediaQuery.of(context).size.width,
                                      height: 170,
                                      child: Center(
                                          child: value.profileIMage != null ? Text("Image") :
                                          Icon(Icons.camera, color: Color(0xFFDADADA), size: 40,)
                                      ),
                                    ),
                                  )
                                ],
                              ),

                              ColumnSpace(30),
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
                            ],
                          );
                        },
                      )
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: RareGemPrimaryButton(
                    child: Text(
                      "Submit",
                      style: GoogleFonts.inter(
                          textStyle: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffFFFFFF))),
                    ), onClick: () {},
                  ),
                ),
                ColumnSpace(40),
              ],
            ),
          ),
        ));
  }
}