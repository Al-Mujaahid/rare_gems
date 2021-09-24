import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rare_gem/frontend/providers/app_provider.dart';
import 'package:rare_gem/frontend/providers/settings/profile_provider.dart';
import 'package:rare_gem/frontend/widgets/spacing.dart';
import 'package:rare_gem/utils/constants/routes.dart';
import 'package:rare_gem/utils/styles/text.dart';
import 'package:rare_gem/utils/styles/text.dart';
import 'package:rare_gem/utils/styles/text.dart';
import 'package:rare_gem/utils/styles/text.dart';
import 'package:rare_gem/utils/styles/text.dart';
import 'package:rare_gem/utils/styles/text.dart';
import 'package:rare_gem/utils/styles/text.dart';
import 'package:rare_gem/utils/styles/text.dart';
//import 'package:rare_gem/utils/routes.dart';
//import 'package:rare_gem/frontend/screen/settings/settings.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ColumnSpace(20),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Container(
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 60)),
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey,
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(100, 50, 100, 50),
                        child: Consumer<ProfileProvider>(
                          builder: (context, value, child) {
                            return Column(
                              children: [
                                Text(
                                  "${value.user != null ? value.user['name'] : 'loading...'}",
                                  style: interTextStyle.copyWith(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "${value.user != null ? value.user['email'] : 'loading...'}",
                                  style: interTextStyle.copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey),
                                ),
                              ],
                            );
                          },
                        )),
                  ],
                ),
              ),
            ),
            //..........................SECOND SEGMENT OF THE PAGE
            Container(
              decoration: BoxDecoration(color: Color(0xffffffff)),
              child: Column(
                children: [
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, MY_PROFILE_ROUTE),
                    child: Container(
                        decoration: BoxDecoration(),
                        child: ListTile(
                          leading: Icon(Icons.person),
                          title: Text(
                            "My Profile",
                            style: interTextStyle.copyWith(
                                fontSize: 17, fontWeight: FontWeight.w400),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        )),
                  ),
                  InkWell(
                    child: Container(
                        decoration: BoxDecoration(),
                        child: ListTile(
                          leading: Icon(Icons.settings),
                          title: Text(
                            "Security",
                            style: interTextStyle.copyWith(
                                fontSize: 17, fontWeight: FontWeight.w400),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        )),
                    onTap: () => Navigator.pushNamed(
                        context, SECURITY_CHANGE_PASSWORD_ROUTE),
                  ),
                  InkWell(
                    child: Container(
                        decoration: BoxDecoration(),
                        child: ListTile(
                          leading: Icon(Icons.message),
                          title: Text(
                            "Contact Us",
                            style: interTextStyle.copyWith(
                                fontSize: 17, fontWeight: FontWeight.w400),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        )),
                    onTap: () =>
                        Navigator.of(context).pushNamed(SETTINGS_CONTACT_ROUTE),
                  ),
                  InkWell(
                    child: Container(
                        decoration: BoxDecoration(),
                        child: ListTile(
                          leading: Icon(Icons.perm_data_setting_rounded),
                          title: Text(
                            "Knowledgeable",
                            style: interTextStyle.copyWith(
                                fontSize: 17, fontWeight: FontWeight.w400),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        )),
                    onTap: () => Navigator.of(context)
                        .pushNamed(SETTINGS_KNOWLEDGEABLE_ROUTE),
                  ),
                  InkWell(
                    child: Container(
                        decoration: BoxDecoration(),
                        child: ListTile(
                          leading: Icon(Icons.link),
                          title: Text(
                            "Touch ID",
                            style: interTextStyle.copyWith(
                                fontSize: 17, fontWeight: FontWeight.w400),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        )),
                  ),
                  InkWell(
                    onTap: () =>
                        Provider.of<AppProvider>(context, listen: false)
                            .logout(context),
                    child: Container(
                        decoration: BoxDecoration(),
                        child: ListTile(
                          leading: Icon(Icons.logout),
                          title: Text(
                            "Logout",
                            style: interTextStyle.copyWith(
                                fontSize: 17, fontWeight: FontWeight.w400),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        )),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
