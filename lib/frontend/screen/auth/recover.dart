import 'package:google_fonts/google_fonts.dart';
import 'package:rare_gem/frontend/providers/auth/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rare_gem/frontend/widgets/button.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/utils/constants/routes.dart';
import 'package:rare_gem/utils/styles/colors.dart';
import 'package:rare_gem/utils/styles/text.dart';

class RecoverPasswordPage extends StatelessWidget {
  const RecoverPasswordPage({Key? key}) : super(key: key);

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
                    ColumnSpace(55),
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    ColumnSpace(32),

                    Text("Recover your account", style: GoogleFonts.inter(
                      fontSize: 40, fontWeight: FontWeight.w700, color: Colors.black
                    ),),
                    ColumnSpace(16),
                    Text("Enter your email and will send you instruction on how to reset it", style: GoogleFonts.inter(
                      fontSize: 17, fontWeight: FontWeight.w400, color: Colors.black
                    ),),
                    ColumnSpace(30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email', style: subtitleStyle, textAlign: TextAlign.left,),
                        TextFormField(
                          onChanged: (String text) => value.setEmail = text,
                        ),
                      ],
                    ),
                    ColumnSpace(315),
                    if (value.loading) ...[CircularProgressIndicator()],
                    if (!value.loading) ...[
                      Row(
                        children: [
                          Expanded(
                            child: RareGemPrimaryButton(
                              child: Text("Recover Password", style: buttonTextStyle.copyWith(
                                fontWeight: FontWeight.w600, color: Colors.white
                              )),
                              onClick: () => value.login(context),
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
                      // ColumnSpace(46)
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
