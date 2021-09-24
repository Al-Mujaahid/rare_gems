import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rare_gem/frontend/screen/intro/intro_base_page.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/src/models/core/IntroPageItem.dart';
import 'package:rare_gem/src/services/index.dart';
import 'package:rare_gem/utils/constants/constants.dart';
import 'package:rare_gem/utils/constants/routes.dart';
import 'package:rare_gem/utils/styles/colors.dart';
import 'package:rare_gem/utils/styles/text.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({ Key? key }) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  List<IntroPageItem> introPageItems = [
    IntroPageItem('Smart Trade', 'We help you trade gold and silver effortlessly'),
    IntroPageItem('Smart Investment', 'We help you build a habit of saving for long term finances'),
    IntroPageItem('Secure and Reliable', 'We help you build a habit of saving for long term finances'),
  ];

  int _currentIntroIndex = 0;
  
  IntroPageItem? introPageItem;
  @override
  void initState() { 
    super.initState();
    introPageItem = introPageItems.first;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Image.asset('assets/images/intro.png'),
                );  
              },
              onPageChanged: (int index) {
                setState(() {
                  _currentIntroIndex = index;
                  introPageItem = introPageItems[index];
                });
              },
            ),
          ),
          ColumnSpace(32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ...introPageItems.map((e) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: CircleAvatar(
                  backgroundColor: e.title == introPageItem!.title ? primaryColor : Color(0xFF666666),
                  radius: 5
                ),
              ))
            ]
          ),

          ColumnSpace(32),
          Text("${introPageItem!.title}", style: sfProTextStyle.copyWith(
            fontSize: 28, fontWeight: FontWeight.w700
          ),),
          ColumnSpace(8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text("${introPageItem!.description}", style: interTextStyle.copyWith(
              fontSize: 17, fontWeight: FontWeight.w400
            ), textAlign: TextAlign.center,),
          ),
          ColumnSpace(32),
          if ((introPageItems.last == introPageItem!))
            ...[
              InkWell(
                onTap: () async {
                  await localStorageService.set(USER_BOX, IS_FIRST_TIME_KEY, true);
                  Navigator.of(context).pushNamedAndRemoveUntil(ON_BOARD_PAGE_ROUTE, (route) => false);
                },
                child: Text('Get Started', style: interTextStyle.copyWith(
                  color: primaryColor, fontSize: 17, fontWeight: FontWeight.w600
                ),),
              )
            ],
          if (!(introPageItems.last == introPageItem!))
            ...[
              Text('Swipe Left', style: GoogleFonts.inter(
                color: primaryColor, fontSize: 17, fontWeight: FontWeight.w600
              ),)
            ],
          ColumnSpace(100),
        ],
      ),
    );
  }
}