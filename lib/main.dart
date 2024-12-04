import 'package:flutter/material.dart';

import 'package:paws_envy/screens/login.page.dart';
import 'package:paws_envy/screens/role.page.dart';
import 'package:paws_envy/screens/welcome.page.dart';

// TODO:
// ~ Complete Login + Signup UI
// ~ Implement Auth Backend
// ~ Complete Dashboard UI

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PawsEnvy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomePage(),
        '/login': (context) => const LoginPage(),
        '/role': (context) => const RoleSelectionPage(),
      },
    );
  }
}
