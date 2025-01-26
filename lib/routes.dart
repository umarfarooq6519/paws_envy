import 'package:flutter/material.dart';

import 'package:paws_envy/screens/Dashboard/dashboard.screen.dart';
import 'package:paws_envy/screens/NearbyPetCare/nearby_pet_care.dart';
import 'package:paws_envy/screens/Profile/profile.screen.dart';
import 'package:paws_envy/screens/RoleSelection/roleselection.screen.dart';
import 'package:paws_envy/screens/Welcome/welcome.screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/welcome': (context) => const WelcomeScreen(),
    '/role': (context) => const RoleSelectionPage(),
    '/dash': (context) => const Dashboard(),
    '/profile': (context) => const ProfileScreen(),
    '/pet_care_nearby': (context) => const NearbyPetCare(),
  };
}
