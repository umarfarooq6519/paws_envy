import 'package:flutter/material.dart';

import 'package:paws_envy/screens/Dashboard/activities.section.dart';
import 'package:paws_envy/screens/Dashboard/pets.section.dart';
import 'package:paws_envy/screens/Dashboard/services.section.dart';
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
    return ListView(
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: SearchBarField(),
        ),
        DashboardPetsSection(),
        SizedBox(height: 30),
        DashboardServicesSection(),
        SizedBox(height: 25),
        DashboardActivitiesSection(),
      ],
    );
  }
}
