import 'package:flutter/material.dart';
import 'package:paws_envy/screens/auth.page.dart';
import 'package:paws_envy/screens/home.page.dart';
import 'package:paws_envy/screens/welcome.page.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomePage(),
        '/auth': (context) => const AuthPage(),
      },
    );
  }
}
