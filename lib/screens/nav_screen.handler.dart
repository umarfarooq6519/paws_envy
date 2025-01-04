import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'package:paws_envy/config/utils/colors.styles.dart';
import 'package:paws_envy/screens/Camera/camera.screen.dart';
import 'package:paws_envy/screens/Community/community.screen.dart';
import 'package:paws_envy/screens/Dashboard/dashboard.screen.dart';
import 'package:paws_envy/screens/Pets/pet.screen.dart';
import 'package:paws_envy/screens/Services/services.screen.dart';
import 'package:paws_envy/widgets/custom_bottom_nav.dart';
import 'package:paws_envy/widgets/custom_app_bar.dart';

class NavScreenHandler extends StatefulWidget {
  const NavScreenHandler({super.key});

  @override
  State<NavScreenHandler> createState() => _NavScreenHandlerState();
}

class _NavScreenHandlerState extends State<NavScreenHandler> {
  int _currentIndex = 0;

  // list of screens accessible from bottom nav
  final List<Widget> _pages = const [
    Dashboard(),
    CommunityScreen(),
    CameraScreen(),
    ServicesScreen(),
    PetScreen(),
  ];

  void handlePageChange(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  // ##### Screen Index Handler #####
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),

      body: _pages[_currentIndex],

      // ##### Bottom Navigation Bar #####

      bottomNavigationBar: Container(
        // margin: const EdgeInsets.only(left: 4, right: 4, bottom: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.secondaryAccent,
          // borderRadius: BorderRadius.circular(30),
        ),
        child: CustomBottomNav(
          onTabChange: handlePageChange,
        ),
      ),

      floatingActionButton: _chatbotBtn(),
    );
  }

  // ################################

  Container _chatbotBtn() => Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.black),
          borderRadius: BorderRadius.circular(17),
        ),
        child: FloatingActionButton(
          backgroundColor: AppColors.secondary,
          onPressed: () {},
          child: Icon(LineIcons.robot),
        ),
      );
}
