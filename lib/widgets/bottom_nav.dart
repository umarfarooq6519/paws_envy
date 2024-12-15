import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:paws_envy/config/utils/colors.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 4, right: 4, bottom: 4),
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: GNav(
          // onTabChange: (int newIndex) {
          //   setState(() {
          //     _currentIndex = newIndex;
          //   });
          // },
          haptic: true,
          iconSize: 24,
          rippleColor: Colors.white30,
          tabBackgroundColor: Colors.white10,
          tabBorderRadius: 22,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          gap: 6,
          color: AppColors.white.withOpacity(0.7),
          activeColor: AppColors.white,
          tabs: _navigationTabs, // Your tab list
        ),
      ),
    );
  }

  List<GButton> get _navigationTabs {
    return const [
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
    ];
  }
}
