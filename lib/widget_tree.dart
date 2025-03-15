import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:paws_envy/services/auth.service.dart';
import 'package:paws_envy/screens/home.dart';
import 'package:paws_envy/screens/RoleSelection/roleselection.screen.dart';
import 'package:paws_envy/screens/Welcome/welcome.screen.dart';

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final Future<bool> status = _checkIfNewUser();
          if (status == true) {
            return const RoleSelectionPage();
          }
          return const HomePage();
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
