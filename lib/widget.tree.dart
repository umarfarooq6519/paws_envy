import 'package:flutter/material.dart';
import 'package:paws_envy/config/firebase/auth.model.dart';
import 'package:paws_envy/screens/role.page.dart';
import 'package:paws_envy/screens/welcome.page.dart';

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
            return const RoleSelectionPage();
          } else {
            return const WelcomePage();
          }
        });
  }
}
