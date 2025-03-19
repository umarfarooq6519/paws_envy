import 'package:flutter/material.dart';

import 'package:paws_envy/screens/Dashboard/dashboard.screen.dart';
import 'package:paws_envy/screens/NearbyPetCare/nearby_pet_care.dart';
import 'package:paws_envy/screens/Profile/profile.screen.dart';
import 'package:paws_envy/screens/RoleSelection/role_selection.screen.dart';
import 'package:paws_envy/screens/Welcome/welcome.screen.dart';
import 'package:paws_envy/screens/pet_sitters.dart';
import 'package:paws_envy/screens/pet_walkers.dart';
import 'package:paws_envy/widget_tree.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/welcome': (context) => const WelcomeScreen(),
    '/widget_tree': (context) => WidgetTree(),
    '/role': (context) => RoleSelectionPage(),
    '/dash': (context) => const Dashboard(),
    '/profile': (context) => const ProfileScreen(),
    '/pet_care_nearby': (context) => NearbyPetCare(),
    '/pet_sitters': (context) => PetSittersScreen(),
    '/pet_walkers': (context) => PetWalkersScreen(),
  };
}
