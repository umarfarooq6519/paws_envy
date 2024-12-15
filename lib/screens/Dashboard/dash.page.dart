import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:paws_envy/config/firebase/auth.config.dart';
import 'package:paws_envy/config/utils/colors.dart';

import 'package:paws_envy/screens/Dashboard/activity.section.dart';
import 'package:paws_envy/screens/Dashboard/pets.section.dart';
import 'package:paws_envy/screens/Dashboard/services.section.dart';
import 'package:paws_envy/widgets/bottom_nav.dart';
import 'package:paws_envy/widgets/custom_app_bar.dart';
import 'package:paws_envy/widgets/search_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Future<void> handleSignOut(context) async {
    await AuthModel().signOut();
    print('User Signed Out');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: ListView(
        children: const [
          SearchBarField(),
          SizedBox(height: 30),
          DashboardPetsSection(),
          SizedBox(height: 30),
          DashboardServicesSection(),
          SizedBox(height: 35),
          DashboardActivitySection(),
        ],
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
