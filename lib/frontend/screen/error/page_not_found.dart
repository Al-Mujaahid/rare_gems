import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rare_gem/frontend/widgets/button.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/utils/constants/routes.dart';
import 'package:rare_gem/utils/styles/colors.dart';
import 'package:rare_gem/utils/styles/text.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Page Not Found", style: subtitleStyle.copyWith(
              fontSize: 40,
            ),),
            ColumnSpace(16),
            InkWell(
              onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(INITIAL_PAGE_ROUTE, (route) => false),
              child: RareGemFilledButton(
                child: Text("Go Home", style: GoogleFonts.inter(
                  fontSize: 17, color: Colors.white, fontWeight: FontWeight.w700
                ),),
                color: disabledColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
