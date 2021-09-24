import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/utils/constants/routes.dart';
import 'package:rare_gem/utils/styles/text.dart';
import 'package:rare_gem/utils/styles/text.dart';
import 'package:rare_gem/utils/styles/text.dart';
import 'package:rare_gem/utils/styles/text.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({Key? key}) : super(key: key);

  @override
  _SecurityScreenState createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
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
                          child: Text('Security', style: subtitleStyle.copyWith(
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
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Account Security",
                          style: sfProTextStyle.copyWith(
                              fontSize: 34, fontWeight: FontWeight.w700
                          ),
                        ),
                        ColumnSpace(13),
                        Text(
                          "Update and enhance your account security here.",
                          style: subtitleStyle.copyWith(
                            fontSize: 15,
                          ),
                        ),

                        Padding(padding: EdgeInsets.only(bottom: 30)),

                        Divider(),
                        InkWell(
                          onTap: () => Navigator.pushNamed(context, SECURITY_CHANGE_PASSWORD_ROUTE),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 11),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "Change Password",
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
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 11),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                      "Touch ID",
                                      style: interTextStyle.copyWith(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                      )
                                  ),
                                ),
                                CupertinoSwitch(value: true, onChanged: (changed) {}),
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