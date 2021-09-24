import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rare_gem/frontend/screen/intro/intro_screen.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/src/models/core/IntroPageItem.dart';
import 'package:rare_gem/utils/styles/colors.dart';
import 'package:rare_gem/utils/styles/text.dart';

class IntroBasePageScreen extends StatelessWidget {
  IntroBasePageScreen(this.introPageItem, this.isLast, { Key? key }) : super(key: key);

  IntroPageItem introPageItem;
  bool isLast;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/intro.png'),
          ColumnSpace(32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: primaryColor,
                radius: 5
              ),
              RowSpace(8),
              CircleAvatar(
                backgroundColor: primaryColor,
                radius: 5
              ),
              RowSpace(8),
              CircleAvatar(
                backgroundColor: primaryColor,
                radius: 5
              ),
            ]
          ),
          ColumnSpace(32),
          Text("${introPageItem.title}", style: sfProTextStyle.copyWith(
            fontSize: 28, fontWeight: FontWeight.w700
          ),),
          ColumnSpace(8),
          Text("${introPageItem.description}", style: GoogleFonts.inter(
            fontSize: 17, fontWeight: FontWeight.w400
          ), textAlign: TextAlign.center,),
          ColumnSpace(32),
          if (isLast)
            ...[
              Text('Get Started', style: GoogleFonts.inter(
                color: primaryColor, fontSize: 17, fontWeight: FontWeight.w600
              ),)
            ],
          if (!isLast)
            ...[
              Text('Swipe Left', style: GoogleFonts.inter(
                color: primaryColor, fontSize: 17, fontWeight: FontWeight.w600
              ),)
            ],
        ],
      ),
    );
  }
}