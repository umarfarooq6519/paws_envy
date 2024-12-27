import 'package:flutter/material.dart';
import 'package:paws_envy/screens/nav_screen.handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:paws_envy/config/firebase/auth.config.dart';
import 'package:paws_envy/screens/RoleSelection/roleselection.screen.dart';
import 'package:paws_envy/screens/Welcome/welcome.screen.dart';

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
          return const NavScreenHandler();
        } else {
          return const WelcomeScreen();
        }
      },
    );
  }

  // function to check if the user is new
  Future<bool> _checkIfNewUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isNewUser = prefs.getBool('isNewUser') ?? false;
    return isNewUser;
  }
}
