import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/utils/constants/routes.dart';
import 'package:rare_gem/utils/styles/text.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: Column(
          children: [
            ColumnSpace(55),
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
                      child: Text('My Profile', style: subtitleStyle.copyWith(
                        fontWeight: FontWeight.w600, color: Colors.black
                      ),),
                    ),
                  )
                ],
              ),
            ),
            ColumnSpace(21),
            Divider(),
            ColumnSpace(14),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Update your profile information",
                      style: sfProTextStyle.copyWith(
                        fontSize: 34, fontWeight: FontWeight.w700
                      ),
                    ),
                    ColumnSpace(13),
                    Text(
                      "Please ensure you use the right information as connected to your RareGems account.",
                      style: subtitleStyle.copyWith(
                          fontSize: 15,
                      ),
                    ),
                    ColumnSpace(50),
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
                                "Personal Information",
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
                      onTap: () => Navigator.pushNamed(context, MY_PROFILE_ADDRESS_ROUTE),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 11),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                "Address",
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
                      onTap: () => Navigator.pushNamed(context, MY_PROFILE_BANK_INFORMATION_ROUTE),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 11),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                "Bank Information",
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
                      onTap: () => Navigator.pushNamed(context, MY_PROFILE_NEXT_OF_KIN_ROUTE),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 11),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                "Next of Kin",
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
                      onTap: () => Navigator.pushNamed(context, MY_PROFILE_IDENTITY_ROUTE),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 11),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                "Identity",
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
        ));
  }
}