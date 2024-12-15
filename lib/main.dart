import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:paws_envy/firebase_options.dart';

import 'package:paws_envy/widget.tree.dart';
import 'package:paws_envy/screens/Dashboard/dash.page.dart';
import 'package:paws_envy/screens/RoleSelection/role.page.dart';
import 'package:paws_envy/screens/Welcome/welcome.page.dart';
import 'package:paws_envy/config/utils/colors.dart';
import 'package:paws_envy/config/firebase/auth.config.dart';

// TODO
// ~ Complete Login + Signup UI ✅
// ~ Complete Dashboard UI ✅
// ~ Implement Auth Backend ✅
// ~ Implement Profile Page
// ~ Implement Modular Color Scheme
// ~ Push to GitHub

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ChangeNotifierProvider<AuthModel>(
      create: (context) => AuthModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PawsEnvy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        iconTheme: const IconThemeData(size: 28, color: AppColors.black),
        colorScheme: ColorScheme.fromSeed(
          surface: AppColors.purpleAccent, // handles all surface bg colors
          seedColor: AppColors.lightPurple,
          onSurface: AppColors.black,
        ),
        fontFamily: 'Poppins',
      ),
      home: const WidgetTree(),
      routes: {
        '/welcome': (context) => const WelcomePage(),
        '/role': (context) => const RoleSelectionPage(),
        '/dash': (context) => const Dashboard(),
      },
    );
  }
}
