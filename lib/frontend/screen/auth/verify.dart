import 'package:google_fonts/google_fonts.dart';
import 'package:rare_gem/frontend/providers/auth/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rare_gem/frontend/widgets/button.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/utils/constants/routes.dart';
import 'package:rare_gem/utils/styles/colors.dart';
import 'package:rare_gem/utils/styles/text.dart';

class VerifyAccountPage extends StatelessWidget {
  const VerifyAccountPage({Key? key}) : super(key: key);

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

                    Text("Verify your account", style: GoogleFonts.inter(
                      fontSize: 40, fontWeight: FontWeight.w700, color: Colors.black
                    ),),
                    ColumnSpace(16),
                    Text("We’ve sent your verification code to johnogunmosu@gmail.com", style: GoogleFonts.inter(
                      fontSize: 17, fontWeight: FontWeight.w400, color: Colors.black
                    ),),
                    ColumnSpace(30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Enter code', style: subtitleStyle, textAlign: TextAlign.left,),
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
                              child: Text("Verify", style: buttonTextStyle.copyWith(
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Resend Code'),
                            Text('1:20 min left')
                          ],
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
