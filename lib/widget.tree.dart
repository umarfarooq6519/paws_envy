import 'package:flutter/material.dart';
import 'package:paws_envy/config/firebase/auth.config.dart';
import 'package:paws_envy/screens/dash.page.dart';

import 'package:paws_envy/screens/role.page.dart';
import 'package:paws_envy/screens/welcome.page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthModel().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final status = _checkIfNewUser();
          if (status == true) {
            return const RoleSelectionPage();
          }
          return const Dashboard();
        } else {
          return const WelcomePage();
        }
      },
    );
  }

  _checkIfNewUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isNewUser = prefs.getBool('isNewUser') ?? false;
    return isNewUser;
  }
}
