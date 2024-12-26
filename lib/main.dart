import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:paws_envy/widget.tree.dart';
import 'package:paws_envy/config/utils/colors.styles.dart';
import 'package:paws_envy/screens/Dashboard/dashboard.screen.dart';
import 'package:provider/provider.dart';
import 'package:paws_envy/config/firebase_options.dart';
import 'package:paws_envy/config/firebase/auth.config.dart';
import 'package:paws_envy/screens/RoleSelection/roleselection.screen.dart';
import 'package:paws_envy/screens/Welcome/welcome.screen.dart';

Future<void> main() async {
  await dotenv.load(); // ensure all env variables are loaded

  WidgetsFlutterBinding.ensureInitialized();
  // ensures the firebase options are loaded
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
        iconTheme: const IconThemeData(
          size: 28,
          color: AppColors.black,
        ),
        colorScheme: ColorScheme.fromSeed(
          surface: AppColors.secondaryAccent,
          seedColor: AppColors.primary,
          onSurface: AppColors.black,
        ),
        fontFamily: 'Poppins',
      ),
      // loads widget tree on app launch
      home: const WidgetTree(),
      routes: {
        '/welcome': (context) => const WelcomeScreen(),
        '/role': (context) => const RoleSelectionPage(),
        '/dash': (context) => const Dashboard(),
      },
    );
  }
}
