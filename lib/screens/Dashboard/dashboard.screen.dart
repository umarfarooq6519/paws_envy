import 'package:flutter/material.dart';

import 'package:paws_envy/config/firebase/auth.config.dart';
import 'package:paws_envy/config/utils/colors.styles.dart';
import 'package:paws_envy/screens/Dashboard/activities.section.dart';
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
  @override
  // ##### Dashboard Screen #####
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 18, right: 18, bottom: 18, top: 12),
            child: SearchBarField(),
          ),
          DashboardPetsSection(),
          SizedBox(height: 30),
          DashboardServicesSection(),
          SizedBox(height: 30),
          DashboardActivitiesSection(),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Padding(
          padding: EdgeInsets.all(14),
          child: BottomNav(),
        ),
      ),
    );
  }
}
