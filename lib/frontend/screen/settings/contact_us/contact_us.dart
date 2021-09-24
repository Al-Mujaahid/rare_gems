import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/utils/styles/text.dart';
//import 'package:get/get.dart';

class SettingContactScreen extends StatefulWidget {
  const SettingContactScreen({Key? key}) : super(key: key);

  @override
  _SettingContactScreenState createState() => _SettingContactScreenState();
}

class _SettingContactScreenState extends State<SettingContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
          child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ColumnSpace(20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context) ,
                          child: Icon(Icons.arrow_back_ios, color: Colors.black, size: 24,),
                        ),
                        Expanded(
                          child: Center(
                            child: Text('Contact Us', style: subtitleStyle.copyWith(
                                fontWeight: FontWeight.w600, color: Colors.black
                            ),),
                          ),
                        )
                      ],
                    ),
                  ),
                  ColumnSpace(21),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 15, 25, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Contact Information",
                          style: interTextStyle.copyWith(
                            fontSize: 34, fontWeight: FontWeight.w700
                          ),
                        ),
                        ColumnSpace(11),
                        Text(
                          "Get in touch with us. We look forwars to hearing from you",
                          style: interTextStyle.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff666666)
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 30)),
                        Divider(),
                        SizedBox(height: 20),
                        Text(
                          "Social Media",
                          style: interTextStyle.copyWith(
                            fontSize: 20,
                            color: Color(0xffF60780),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Icon(Icons.apps, color: Colors.black),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.whatshot, color: Colors.black),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.fireplace, color: Colors.black),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.phone_android, color: Colors.black),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.batch_prediction, color: Colors.black),
                          ],
                        ),
                        SizedBox(height: 20),
                        Divider(),
                        SizedBox(height: 20),
                        Text(
                          "Main office-Lekki",
                          style: interTextStyle.copyWith(
                            fontSize: 20,
                            color: Color(0xffF60780),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        ColumnSpace(15),
                        Text(
                          "58B Omorinre John Street, Lekki Phase 1, Lekki, Lagos Nigeria",
                          style: subtitleStyle,
                        ),
                        ColumnSpace(15),
                        Text(
                          "Phone",
                          style: interTextStyle.copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff000000)
                          ),
                        ),
                        ColumnSpace(5),
                        Text(
                          "09017163178",
                          style: subtitleStyle,
                        ),
                        ColumnSpace(40),
                        Divider(),
                        ColumnSpace(15),
                        Text(
                          "Ikeja Office",
                          style: interTextStyle.copyWith(
                            fontSize: 20,
                            color: Color(0xffF60780),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        ColumnSpace(15),
                        Text(
                          "3, Allen Avenue, Tecno Mobile, Toyin St, beside Mama Cass, Allen, Ikeja, Lagos.",
                          style: interTextStyle.copyWith(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff666666)
                          ),
                        ),
                        ColumnSpace(15),
                        Text(
                          "Phone",
                          style: interTextStyle.copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff000000)
                          ),
                        ),
                        ColumnSpace(5),
                        Text(
                          "09017163178",
                          style: interTextStyle.copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff666666)
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ));
  }
}