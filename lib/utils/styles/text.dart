import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

TextStyle subtitleStyle = GoogleFonts.inter(
  fontWeight: FontWeight.w400, fontSize: 17, color: Color(0xFF8A8A8F)
);

TextStyle titleStyle = GoogleFonts.inter(
  fontWeight: FontWeight.w700,
);

TextStyle buttonTextStyle = GoogleFonts.inter(
  fontWeight: FontWeight.w400, fontSize: 17
);

TextStyle selectedBottomNavLabelStyle = GoogleFonts.inter(
  fontSize: 10, color: primaryColor, fontWeight: FontWeight.w400
);

TextStyle unSelectedBottomNavLabelStyle = GoogleFonts.inter(
    fontSize: 10, color: disabledColor, fontWeight: FontWeight.w400
);

TextStyle sfProTextStyle = TextStyle(
  fontFamily: 'SFPro'
);

TextStyle formLabelTextStyle = subtitleStyle.copyWith(
  color: Color(0xFF8A8A8F)
);

TextStyle interTextStyle = GoogleFonts.inter();