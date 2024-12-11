import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:paws_envy/config/utils/colors.dart';
import 'package:paws_envy/screens/dash.page.dart';
import 'package:provider/provider.dart';
import 'package:paws_envy/firebase_options.dart';
import 'package:paws_envy/config/firebase/auth.model.dart';

import 'package:paws_envy/screens/role.page.dart';
import 'package:paws_envy/screens/welcome.page.dart';
import 'package:paws_envy/widget.tree.dart';

// TODO
// ~ Complete Login + Signup UI
// ~ Complete Dashboard UI
// ~ Implement Auth Backend

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
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
        ),
        useMaterial3: true,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.purpleAccent,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black38,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w500,
          ),
          showSelectedLabels: true,
        ),
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
