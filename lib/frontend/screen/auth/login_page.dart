import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rare_gem/frontend/providers/auth/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rare_gem/frontend/widgets/button.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/utils/constants/routes.dart';
import 'package:rare_gem/utils/styles/colors.dart';
import 'package:rare_gem/utils/styles/text.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Consumer<LoginProvider>(
            builder: (context, value, child) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ColumnSpace(108),
                    Text("Welcome back", style: GoogleFonts.inter(
                      fontSize: 40, fontWeight: FontWeight.w700, color: Colors.black
                    ),),
                    ColumnSpace(16),
                    Text("Sign in to continue", style: GoogleFonts.inter(
                      fontSize: 17, fontWeight: FontWeight.w400, color: Colors.black
                    ),),
                    ColumnSpace(30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Username', style: subtitleStyle, textAlign: TextAlign.left,),
                        TextFormField(
                          onChanged: (String text) => value.setEmail = text,
                        ),
                      ],
                    ),
                    ColumnSpace(24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Password', style: subtitleStyle, textAlign: TextAlign.left,),
                        TextFormField(
                          onChanged: (String text) => value.setPassword = text,
                          obscureText: true,
                        ),
                      ],
                    ),
                    ColumnSpace(24),
                    InkWell(
                      onTap: () => Navigator.of(context).pushNamed(RECOVER_PASSWORD_PAGE_ROUTE),
                      child: Text('Forgot password?', style: subtitleStyle),
                    ),
                    ColumnSpace(24),
                    // if (value.loading) ...[CircularProgressIndicator()],
                    if (!value.loading) ...[
                      Row(
                        children: [
                          Expanded(
                            child: RareGemPrimaryButton(
                              child: Text("Sign In", style: buttonTextStyle.copyWith(
                                fontWeight: FontWeight.w600, color: Colors.white
                              )),
                              // onClick: () => value.login(context),
                              onClick: value.formValid ? () => value.login(context) : null,
                            ),
                          ),
                        ],
                      ),
                      ColumnSpace(126),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RareGemPrimaryOutlineButton(
                            child: Icon(Icons.face, color: primaryColor),
                            onClick: () => Navigator.of(context).pushNamed(ALREADY_LOGGEDIN_PAGE_ROUTE),
                          ),
                          RowSpace(16),
                          RareGemPrimaryOutlineButton(
                            child: Icon(Icons.golf_course, color: primaryColor),
                            onClick: () => Navigator.of(context).pushNamed(VERIFY_ACCOUNT_PAGE_ROUTE),
                          ),
                        ],
                      ),
                      ColumnSpace(24),
                      Container(
                        alignment: Alignment.center,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: subtitleStyle,
                            children: [
                              TextSpan(
                                style: subtitleStyle.copyWith(
                                  color: Color(0xFF666666)
                                ),
                                text: 'Don’t have an account? '
                              ),
                              TextSpan(
                                text: 'Sign Up', style: subtitleStyle.copyWith(
                                  fontWeight: FontWeight.w500, color: primaryColor
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Navigator.of(context).pushNamedAndRemoveUntil(REGISTER_PAGE_ROUTE, (route) => false),
                              )
                            ]
                          ),
                        ),
                      ),
                      ColumnSpace(32),
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
