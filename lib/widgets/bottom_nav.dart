import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:paws_envy/config/utils/colors.styles.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return GNav(
      // onTabChange: (int newIndex) {
      //   setState(() {
      //     _currentIndex = newIndex;
      //   });
      // },
      haptic: true,
      iconSize: 24,
      rippleColor: AppColors.primary.withOpacity(0.3), // Ripple effect
      tabBackgroundColor: Colors.white24, // Active tab background color
      tabBorderRadius: 22, // Rounded corners for the active tab
      tabActiveBorder:
          Border.all(color: AppColors.gray, width: 1), // Optional border
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      gap: 6,
      color: AppColors.white.withOpacity(0.7),
      activeColor: AppColors.white,
      tabs: const [
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
          icon: LineIcons.paw,
          text: 'Pets',
        ),
        GButton(
          icon: LineIcons.user,
          text: 'Profile',
        ),
      ], // Your tab list
    );
  }
}
