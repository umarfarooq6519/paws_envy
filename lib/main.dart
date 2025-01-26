import 'package:flutter/material.dart';
import 'package:paws_envy/routes.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:paws_envy/widget_tree.dart';
import 'package:paws_envy/utils/colors.styles.dart';
import 'package:paws_envy/config/firebase_options.dart';
import 'package:paws_envy/config/auth.config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();

  // ensures the firebase options are loaded
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthConfig(),
        ),
      ],
      child: MyApp(),
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

      // Theme Data
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
        fontFamily: 'Montserrat',
      ),

      // widget tree is the primary location of the app
      home: const WidgetTree(),
      routes: AppRoutes.routes,
    );
  }
}
