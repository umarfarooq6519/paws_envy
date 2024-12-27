import 'package:flutter/material.dart';
import 'package:paws_envy/config/firebase/auth.config.dart';

import 'package:paws_envy/screens/Dashboard/activities.section.dart';
import 'package:paws_envy/screens/Dashboard/pets.section.dart';
import 'package:paws_envy/screens/Dashboard/services.section.dart';
import 'package:paws_envy/widgets/search_bar.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  // ##### Dashboard Screen #####
  Widget build(BuildContext context) {
    return Consumer<AuthModel>(
      builder: (context, authModel, child) {
        final currentUser = authModel.currentUser;

        return ListView(
          children: const [
            Padding(
              padding: EdgeInsets.all(18),
              child: SearchBarField(),
            ),
            DashboardPetsSection(),
            SizedBox(height: 30),
            DashboardServicesSection(),
            SizedBox(height: 30),
            DashboardActivitiesSection(),
          ],
        );
      },
    );
  }
}
