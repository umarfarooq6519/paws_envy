import 'package:flutter/material.dart';

import 'package:paws_envy/screens/Dashboard/dashboard_recent_services.dart';
import 'package:paws_envy/screens/Dashboard/dashboard_pets.dart';
import 'package:paws_envy/screens/Dashboard/dashboard_services.dart';
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
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: SearchBarField(),
          ),
          DashboardPetsSection(),
          SizedBox(height: 20),
          // DashboardServicesSection(),
          // SizedBox(height: 20),
          RecentServicesSection(),
        ],
      ),
    );
  }
}
