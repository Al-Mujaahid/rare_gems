import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rare_gem/frontend/providers/auth/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rare_gem/frontend/providers/auth/register_provider.dart';
import 'package:rare_gem/frontend/widgets/button.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/utils/constants/routes.dart';
import 'package:rare_gem/utils/styles/colors.dart';
import 'package:rare_gem/utils/styles/input.dart';
import 'package:rare_gem/utils/styles/text.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Consumer<RegisterProvider>(
            builder: (context, value, child) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ColumnSpace(108),
                    Text("Sign Up", style: GoogleFonts.inter(
                      fontSize: 40, fontWeight: FontWeight.w700, color: Colors.black
                    ),),
                    ColumnSpace(16),
                    Text("Sign up to join", style: GoogleFonts.inter(
                      fontSize: 17, fontWeight: FontWeight.w400, color: Colors.black
                    ),),
                    ColumnSpace(30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name', style: subtitleStyle, textAlign: TextAlign.left,),
                        TextFormField(
                          onChanged: (String text) => value.setName = text,
                        ),
                      ],
                    ),
                    ColumnSpace(24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email', style: subtitleStyle, textAlign: TextAlign.left,),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Confirm Password', style: subtitleStyle, textAlign: TextAlign.left,),
                        TextFormField(
                          onChanged: (String text) => value.setConfirmPassword = text,
                          obscureText: true,
                          decoration: underlineInputDecoration().copyWith(
                            helperText: '${value.password != value.confirmPassword ? 'Confirm password must be equal to password' : ''}'
                          ),
                        ),
                      ],
                    ),
                    ColumnSpace(17),
                    Container(
                      child: InkWell(
                        onTap: () => value.setAgreedToTerm = !value.agreedToTerms,
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: successColor,
                              radius: 10,
                              child: Icon(Icons.check, color: value.agreedToTerms ? Colors.white : successColor, size: 13,),
                            ),
                            RowSpace(10),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  style: subtitleStyle.copyWith(
                                    color: disabledColor
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "I agree to the ",
                                    ),
                                    TextSpan(
                                      text: "Terms of Service", style: subtitleStyle.copyWith(
                                        fontWeight: FontWeight.w700
                                      )
                                    ),
                                  ]
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ),
                    ColumnSpace(90),
                    // if (value.loading) ...[CircularProgressIndicator()],
                    if (!value.loading) ...[
                      Row(
                        children: [
                          Expanded(
                            child: RareGemPrimaryButton(
                              child: Text("Sign Up", style: buttonTextStyle.copyWith(
                                fontWeight: FontWeight.w600, color: Colors.white
                              )),
                              onClick: value.formValid ? () => value.register(context) : null,
                            ),
                          ),
                        ],
                      ),
                      ColumnSpace(21),
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
                                text: 'Sign In', style: subtitleStyle.copyWith(
                                  fontWeight: FontWeight.w500, color: primaryColor
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Navigator.of(context).pushNamedAndRemoveUntil(LOGIN_PAGE_ROUTE, (route) => false),
                              )
                            ]
                          ),
                        ),
                      ),
                      ColumnSpace(32)
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
