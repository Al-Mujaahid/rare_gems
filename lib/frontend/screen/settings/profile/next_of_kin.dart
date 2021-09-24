import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rare_gem/frontend/widgets/button.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
// /import 'package:get/get.dart';

class MyProfileNextOfKinScreen extends StatefulWidget {
  const MyProfileNextOfKinScreen({Key? key}) : super(key: key);

  @override
  _MyProfileNextOfKinScreenState createState() => _MyProfileNextOfKinScreenState();
}

class _MyProfileNextOfKinScreenState extends State<MyProfileNextOfKinScreen> {
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Next of kin",
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 34, fontWeight: FontWeight.w700)),
                          ),
                          Text(
                            "Update your next of kin information",
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
                                  "Name",
                                  style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff8A8A8F))),
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.text,
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
                                  "Phone",
                                  style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff8A8A8F))),
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.number,
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
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                  ),
                ),
                ColumnSpace(120),
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