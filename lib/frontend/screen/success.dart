//cxk\AppData\Local\Android\Sdk\platform-tools
//C:\Program Files\Common Files\Oracle\Java\javapath

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rare_gem/frontend/widgets/button.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';

class SucessMessage extends StatelessWidget {
  const SucessMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
              child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {},
                  color: Colors.white,
                ),
                ColumnSpace(70),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xffA644FF),
                          radius: 100,
                          child: Icon(Icons.message,
                              color: Colors.white, size: 70),
                        ),
                        ColumnSpace(50),
                        Text("Success!",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff000000),
                                  fontSize: 40),
                            )),
                        ColumnSpace(40),
                        Text(
                            "Your Trade of N150,000 in has been queued and pending admin approval.",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  color: Color(0xff666666), fontSize: 17),
                            )),
                        ColumnSpace(30),
                        Text("Silver Trade",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  color: Color(0xff666666), fontSize: 17),
                            )),
                        ColumnSpace(10),
                        Text("Successful",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff000000),
                                  fontSize: 28),
                            )),
                        ColumnSpace(70),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  color: Color(0xff000000), fontSize: 15),
                            ),
                            text: 'Credited on',
                          ),
                          TextSpan(
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff666666),
                                  fontSize: 15),
                            ),
                            text: '21st May 2021',
                          ),
                          TextSpan(
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  color: Color(0xff666666), fontSize: 15),
                            ),
                            text: 'Paid via bank transfer',
                          )
                        ])),
                        RareGemPrimaryButton(
                          child: Text(
                            "Done",
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffFFFFFF))),
                          ),
                          onClick: () {},
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
        ));
  }
}
