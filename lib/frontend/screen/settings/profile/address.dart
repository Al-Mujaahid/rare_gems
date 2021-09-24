
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rare_gem/frontend/providers/settings/profile_provider.dart';
import 'package:rare_gem/frontend/widgets/button.dart';
import 'package:rare_gem/frontend/widgets/coutnry_code.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';

class MyProfileAddressScreen extends StatelessWidget {


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
                                "Residential Address",
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 34, fontWeight: FontWeight.w700)),
                              ),
                              Text(
                                "Update your residential address",
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff666666))),
                              ),
                              ColumnSpace(30),
                              CountryCodeWidget(onSelect: (value) {

                              }, selected: '${value.user['country']}'),
                              ColumnSpace(30),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "State",
                                      style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff8A8A8F))),
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.text,
                                      initialValue: "${value.user['state']}",
                                    )
                                  ],
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 30)),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "City",
                                      style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff8A8A8F))),
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.text,
                                      initialValue: "${value.user['city']}",
                                    )
                                  ],
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 30)),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Address",
                                      style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff8A8A8F))),
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.text,
                                      initialValue: "${value.user['address']}",
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
                ColumnSpace(80),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: RareGemPrimaryButton(child: Text(
                    "Submit",
                    style: GoogleFonts.inter(
                        textStyle: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffFFFFFF))),
                  ), onClick: () {},),
                ),
                ColumnSpace(40),

              ],
            ),
          ),
        ));
  }
}