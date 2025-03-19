import 'package:flutter/material.dart';
import 'package:paws_envy/screens/service_provider_dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:paws_envy/services/auth.service.dart';
import 'package:paws_envy/screens/home.dart';
import 'package:paws_envy/screens/RoleSelection/role_selection.screen.dart';
import 'package:paws_envy/screens/Welcome/welcome.screen.dart';

class WidgetTree extends StatefulWidget {
  WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  final AuthService _auth = AuthService();

  void handleRoleUpdate() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _auth.authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return FutureBuilder<String>(
            future: _auth.getUserRole(_auth.currentUser!.uid),
            builder: (context, roleSnapshot) {
              if (roleSnapshot.connectionState == ConnectionState.waiting) {
                return _loadingInterface();
              }
              final String role = roleSnapshot.data ?? 'unknown';

              if (role == 'unknown') {
                return RoleSelectionPage();
              }
              if (role == 'pet_owner') {
                return const HomePage();
              }
              if (role == 'service_provider') {
                return const ServiceProviderDashboard();
              }
              return Text('erorrrr');
            },
          );
        } else {
          return const WelcomeScreen();
        }
      },
    );
  }

  Scaffold _loadingInterface() {
    return Scaffold(
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
