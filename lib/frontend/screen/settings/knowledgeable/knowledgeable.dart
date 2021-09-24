import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/utils/constants/routes.dart';
import 'package:rare_gem/utils/styles/text.dart';

class SettingsKnowledgeableScreen extends StatefulWidget {
  const SettingsKnowledgeableScreen({Key? key}) : super(key: key);

  @override
  _SettingsKnowledgeableScreenState createState() => _SettingsKnowledgeableScreenState();
}

class _SettingsKnowledgeableScreenState extends State<SettingsKnowledgeableScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
          child: Container(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          child: Text('Knowledgeable', style: subtitleStyle.copyWith(
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
                          "Knowledgeable",
                          style: interTextStyle.copyWith(
                              fontSize: 34, fontWeight: FontWeight.w700
                          ),
                        ),
                        ColumnSpace(11),
                        Text(
                          "Get more informations about our services, terms and conditions and FAQ on here.",
                          style: interTextStyle.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff666666)
                          ),
                        ),


                        ColumnSpace(30),

                        Divider(),
                        InkWell(
                          onTap: () => Navigator.pushNamed(context, MY_PROFILE_PERSONAL_INFO_ROUTE),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 11),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "Frequently Asked Questions",
                                    style: interTextStyle.copyWith(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                    )
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xffC8C7CC),
                                )
                              ],
                            ),
                          ),
                        ),
                        Divider(),

                        InkWell(
                          onTap: () => Navigator.pushNamed(context, MY_PROFILE_PERSONAL_INFO_ROUTE),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 11),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "Terms and Conditions",
                                    style: interTextStyle.copyWith(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                    )
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xffC8C7CC),
                                )
                              ],
                            ),
                          ),
                        ),
                        Divider(),

                        InkWell(
                          onTap: () => Navigator.pushNamed(context, MY_PROFILE_PERSONAL_INFO_ROUTE),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 11),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "Privacy Policy",
                                    style: interTextStyle.copyWith(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                    )
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xffC8C7CC),
                                )
                              ],
                            ),
                          ),
                        ),
                        Divider(),

                        InkWell(
                          onTap: () => Navigator.pushNamed(context, MY_PROFILE_PERSONAL_INFO_ROUTE),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 11),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "Privacy Policy",
                                    style: interTextStyle.copyWith(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                    )
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xffC8C7CC),
                                )
                              ],
                            ),
                          ),
                        ),
                        Divider(),

                        InkWell(
                          onTap: () => Navigator.pushNamed(context, MY_PROFILE_PERSONAL_INFO_ROUTE),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 11),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "Give us a Review",
                                    style: interTextStyle.copyWith(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                    )
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xffC8C7CC),
                                )
                              ],
                            ),
                          ),
                        ),
                        Divider(),

                        InkWell(
                          onTap: () => Navigator.pushNamed(context, MY_PROFILE_PERSONAL_INFO_ROUTE),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 11),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "Visit Website",
                                    style: interTextStyle.copyWith(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                    )
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xffC8C7CC),
                                )
                              ],
                            ),
                          ),
                        ),
                        Divider(),

                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}