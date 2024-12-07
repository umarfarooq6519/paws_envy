import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:paws_envy/firebase_options.dart';

import 'package:paws_envy/screens/login.page.dart';
import 'package:paws_envy/screens/role.page.dart';
import 'package:paws_envy/screens/welcome.page.dart';

// TODO:
// ~ Complete Login + Signup UI
// ~ Complete Dashboard UI
// ~ Implement Auth Backend

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
        ),
        iconTheme: const IconThemeData(
          size: 14,
        ),
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
