import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rare_gem/frontend/widgets/button.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/utils/constants/routes.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX25869243.jpg'),
                  fit: BoxFit.cover
                )
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 31, horizontal: 32),
            decoration: BoxDecoration(
              color: Colors.transparent
            ),
            child: Column(
              children: [
                ColumnSpace(170),
                Text("Rare Gems", style: GoogleFonts.inter(
                  fontSize: 24, fontWeight: FontWeight.w700, color: Color(0xFFFFFFFF)
                ),),
                ColumnSpace(70),
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Text("Make Money with Ease", style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700, fontSize: 40, color: Color(0xFFFFFFFF)
                        ), textAlign: TextAlign.center,),
                        ColumnSpace(16),
                        Text("Trade gold & silver and make profitable investment with Rare Gems", style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400, fontSize: 17, color: Color(0xFFFFFFFF)
                        ), textAlign: TextAlign.center,),
                        ColumnSpace(40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...List.generate(3, (e) => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                              child: CircleAvatar(
                                backgroundColor: Color(0xFFFFFFFF),
                                radius: 5
                              ),
                            ))
                          ],
                        ),
                        ColumnSpace(55),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: RareGemPrimaryButton(
                                child: Text('Sign Up', style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w700, color: Colors.white, fontSize: 17
                                ), textAlign: TextAlign.center,), onClick: () => Navigator.of(context).pushNamedAndRemoveUntil(REGISTER_PAGE_ROUTE, (route) => false),
                              ),
                            ),
                            RowSpace(16),
                            Expanded(
                              child: RareGemPrimaryButton(
                                child: Text('Sign In', style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w700, color: Colors.white, fontSize: 17
                                ), textAlign: TextAlign.center,), onClick: () => Navigator.of(context).pushNamedAndRemoveUntil(LOGIN_PAGE_ROUTE, (route) => false),
                              ),
                            )
                          ],
                        ),
                        ColumnSpace(55),
                        Text("View market statistics", style: GoogleFonts.inter(
                          fontSize: 17, fontWeight: FontWeight.w400, color: Colors.white
                        ), textAlign: TextAlign.center,),
                        ColumnSpace(54),
                        RichText(
                          text: TextSpan(
                            style: GoogleFonts.inter(
                              fontSize: 13, fontWeight: FontWeight.w400,
                            ),
                            text: "By joining you agree to ours ",
                            children: [
                              TextSpan(
                                text: "Terms of Service", style: GoogleFonts.inter(
                                  fontSize: 13, fontWeight: FontWeight.w700
                                ),
                              ),
                              TextSpan(
                                text: " and "
                              ),
                              TextSpan(
                                text: "Privacy Policy", style: GoogleFonts.inter(
                                  fontSize: 13, fontWeight: FontWeight.w700
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}