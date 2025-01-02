import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import 'package:paws_envy/config/utils/colors.styles.dart';
import 'package:paws_envy/screens/Camera/camera.screen.dart';
import 'package:paws_envy/screens/Community/community.screen.dart';
import 'package:paws_envy/screens/Dashboard/dashboard.screen.dart';
import 'package:paws_envy/screens/Pets/pet.screen.dart';
import 'package:paws_envy/screens/Services/services.screen.dart';
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

  @override
  // ##### Screen Index Handler #####
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),

      body: _pages[_currentIndex],

      // ##### Bottom Navigation Bar #####

      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 4, right: 4, bottom: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child: _bottomNav(),
      ),

      floatingActionButton: _chatbotBtn(),
    );
  }

  // ################################

  FloatingActionButton _chatbotBtn() => FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {},
        child: Icon(LineIcons.robot),
      );

  GNav _bottomNav() => GNav(
        onTabChange: (int newIndex) {
          // switch pages according to index
          setState(() {
            _currentIndex = newIndex;
          });
        },
        haptic: true,
        iconSize: 24,
        rippleColor: AppColors.primary.withOpacity(0.3),
        tabBackgroundColor: AppColors.white.withOpacity(0.1),
        tabBorderRadius: 22,
        tabActiveBorder: Border.all(color: Colors.transparent, width: 1),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        gap: 6,
        color: AppColors.white.withOpacity(0.7),
        activeColor: AppColors.white,
        tabs: _tabsList, // Your tab list
      );

  List<GButton> get _tabsList => const [
        GButton(
          icon: LineIcons.home,
          text: 'Home',
        ),
        GButton(
          icon: LineIcons.users,
          text: 'Community',
        ),
        GButton(
          icon: LineIcons.retroCamera,
          text: 'Camera',
        ),
        GButton(
          icon: LineIcons.heartbeat,
          text: 'Services',
        ),
        GButton(
          icon: LineIcons.paw,
          text: 'My Pets',
        ),
      ];
}
