import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rare_gem/frontend/providers/auth/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rare_gem/frontend/widgets/button.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/utils/constants/routes.dart';
import 'package:rare_gem/utils/styles/colors.dart';
import 'package:rare_gem/utils/styles/input.dart';
import 'package:rare_gem/utils/styles/text.dart';

class AlreadyLoggedIn extends StatelessWidget {
  const AlreadyLoggedIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF2F2F2),
        body: SingleChildScrollView(
          child: Consumer<LoginProvider>(
            builder: (context, value, child) {
              // value.getLoggedInUser();
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    ColumnSpace(108),
                    Text("Welcome back", style: GoogleFonts.inter(
                      fontSize: 40, fontWeight: FontWeight.w700, color: Colors.black
                    ),),
                    ColumnSpace(17),
                    Text("${value.user == null ? '' : value.user['name']}", style: GoogleFonts.inter(
                      fontSize: 17, fontWeight: FontWeight.w400, color: Colors.black
                    ),),
                    ColumnSpace(20),
                    Container(
                      height: 44,
                      child: TextFormField(
                        onChanged: (String text) => value.setPassword = text,
                        obscureText: true,
                        decoration: outlineInputDecoration(
                          fillColor: Colors.white, filled: true, hintText: 'Enter password'
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    ColumnSpace(24),
                    if (value.loading) ...[CircularProgressIndicator()],
                    if (!value.loading) ...[
                      Row(
                        children: [
                          Expanded(
                            child: RareGemPrimaryButton(
                              child: Text("Sign In", style: buttonTextStyle.copyWith(
                                fontWeight: FontWeight.w600, color: Colors.white
                              )),
                              onClick: () => value.confirmLogin(context),
                            ),
                          ),
                        ],
                      ),

                      ColumnSpace(20),
                      RareGemOutlineBigButton(child: Row(
                        children: [
                          Icon(Icons.fingerprint, color: primaryColor),
                          RowSpace(16),
                          Expanded(child: Text('Sign in with finger print', style: subtitleStyle.copyWith(
                            fontWeight: FontWeight.w600, color: primaryColor
                          ),))
                        ],
                      ), color: primaryColor),
                      ColumnSpace(20),
                      Container(
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () => Navigator.pushNamed(context, RECOVER_PASSWORD_PAGE_ROUTE),
                          child: Text('Forgot password?', style: subtitleStyle, textAlign: TextAlign.center,)),
                      ),
                      ColumnSpace(20),
                      Container(
                        alignment: Alignment.center,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: subtitleStyle,
                            children: [
                              TextSpan(
                                style: subtitleStyle.copyWith(
                                  color: disabledColor
                                ),
                                text: 'Not my account? '
                              ),
                              TextSpan(
                                style: subtitleStyle.copyWith(
                                  fontWeight: FontWeight.w600, color: disabledColor
                                ),
                                text: 'click here',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Navigator.of(context).pushNamedAndRemoveUntil(REGISTER_PAGE_ROUTE, (route) => false),
                              ),
                            ]
                          ),
                        ),
                      ),
                      ColumnSpace(232),
                      Container(
                        alignment: Alignment.center,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: subtitleStyle,
                            children: [
                              TextSpan(
                                style: subtitleStyle.copyWith(
                                  color: primaryColor
                                ),
                                text: 'Market Statistics'
                              ),
                              TextSpan(
                                style: subtitleStyle.copyWith(
                                  color: disabledColor, fontWeight: FontWeight.w400
                                ),
                                text: '  |  '
                              ),
                              TextSpan(
                                text: 'FAQ', style: subtitleStyle.copyWith(
                                  fontWeight: FontWeight.w500, color: Colors.black
                                ),
                              )
                            ]
                          ),
                        ),
                      ),
                      ColumnSpace(46),
                    ],
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
