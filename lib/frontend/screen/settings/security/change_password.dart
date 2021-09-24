import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rare_gem/frontend/providers/settings/change_password_provider.dart';
import 'package:rare_gem/frontend/providers/settings/profile_provider.dart';
import 'package:rare_gem/frontend/widgets/button.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/utils/styles/text.dart';
import 'package:rare_gem/utils/styles/text.dart';
import 'package:rare_gem/utils/styles/text.dart';
import 'package:rare_gem/utils/styles/text.dart';
import 'package:rare_gem/utils/styles/text.dart';
import 'package:rare_gem/utils/styles/text.dart';


class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
            child: Container(
                child: SingleChildScrollView(
                  child: Consumer<ChangePasswordProvider>(
                    builder: (context, value, child){
                      return Container(
                        child: Column(children: [
                    ColumnSpace(25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () => Navigator.pop(context) ,
                            child: Icon(Icons.arrow_back_ios, color: Colors.black, size: 24,),
                          ),
                        ],
                      ),
                    ),
                    ColumnSpace(21),
                    Divider(),
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 15, 25, 0),
                      child: Consumer<ChangePasswordProvider>(
                        builder: (context, value, child) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Password Change",
                                style: interTextStyle.copyWith(
                                    fontSize: 34, fontWeight: FontWeight.w700
                                ),
                              ),
                              Text(
                                "Change your password if you think your previous password has been compromised.",
                                style: interTextStyle.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff666666)
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 30)),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Old Password",
                                      style: interTextStyle.copyWith(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff8A8A8F)
                                      ),
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.visiblePassword,
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          icon: Icon(Icons.remove_red_eye,
                                            color: Color(0xff8C8C8C)
                                          ),
                                          onPressed: () => value.togglePasswordIsVisible()
                                        ),
                                      ),
                                      obscureText: !value.passwordIsVisible,
                                      onChanged: (String text) => value.setOldPassword = text,
                                    )
                                  ],
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 30)),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "New Password",
                                      style: interTextStyle.copyWith(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff8A8A8F)
                                      ),
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.visiblePassword,
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                            icon: Icon(Icons.remove_red_eye,
                                                color: Color(0xff8C8C8C)),
                                            onPressed: () => value.togglePasswordIsVisible()),
                                      ),
                                      obscureText: !value.passwordIsVisible,
                                      onChanged: (String text) => value.setNewPassword = text,
                                      
                                    )
                                  ],
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 30)),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Confirm Password",
                                      style: interTextStyle.copyWith(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff8A8A8F)
                                      ),
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.visiblePassword,
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                            icon: Icon(Icons.remove_red_eye,
                                                color: Color(0xff8C8C8C)),
                                            onPressed: () => value.togglePasswordIsVisible()
                                        ),
                                      ),
                                      obscureText: !value.passwordIsVisible,
                                      onChanged: (String text) => value.setConfirmPassword = text,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 120),
                              ),
                              RareGemPrimaryButton(
                                child: Text(
                                  "Submit",
                                  style: interTextStyle.copyWith(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffFFFFFF)
                                  ),
                                ), onClick: value.formValid ? () => value.resetPassword(context) : null,
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ])
                      );
                      }
                  ),
                )
            )
        )
    );
  }
}