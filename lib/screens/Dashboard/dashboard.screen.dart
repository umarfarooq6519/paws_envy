import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:paws_envy/config/firebase/auth.config.dart';

import 'package:paws_envy/config/utils/colors.styles.dart';
import 'package:paws_envy/config/utils/text.styles.dart';
import 'package:paws_envy/models/pets.model.dart';
import 'package:paws_envy/screens/Dashboard/activities.section.dart';
import 'package:paws_envy/screens/Dashboard/pets.section.dart';
import 'package:paws_envy/screens/Dashboard/services.section.dart';
import 'package:paws_envy/widgets/bottom_nav.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // function to handle auth signout
  Future<void> handleSignOut(context) async {
    await AuthModel().signOut();
    print('User Signed Out');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarSection(),
      body: ListView(
        children: [
          _searchField(),
          const DashboardPetsSection(),
          const SizedBox(height: 30),
          const DashboardServicesSection(),
          const SizedBox(height: 30),
          const DashboardActivitiesSection(),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(4),
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

  AppBar _appBarSection() {
    return AppBar(
      iconTheme: const IconThemeData(
        size: 28,
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            LineIcons.bars,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  LineIcons.bell,
                ),
              ),
              IconButton(
                onPressed: () {
                  handleSignOut(context);
                },
                icon: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/person_3.jpg'),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Container _searchField() {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.primary,
            blurRadius: 15,
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.white,
            contentPadding: const EdgeInsets.all(15),
            hintText: "Search Anything",
            hintStyle: TextStyles.dimText,
            prefixIcon: const Padding(
              padding: EdgeInsets.all(15),
              child: Icon(
                LineIcons.search,
                color: AppColors.gray,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            )),
      ),
    );
  }
}
