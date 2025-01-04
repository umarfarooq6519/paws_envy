import 'package:flutter/material.dart';

import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:paws_envy/config/utils/colors.styles.dart';
import 'package:paws_envy/config/utils/text.styles.dart';

class CustomBottomNav extends StatefulWidget {
  final ValueChanged<int> onTabChange;

  const CustomBottomNav({super.key, required this.onTabChange});

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  @override
  Widget build(BuildContext context) {
    return GNav(
      onTabChange: widget.onTabChange,
      haptic: true,
      iconSize: 24,
      rippleColor: AppColors.white.withOpacity(0.5),
      tabBackgroundColor: AppColors.primaryAccent.withOpacity(1),
      tabBorderRadius: 22,
      tabActiveBorder: Border.all(color: Colors.black, width: 1),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      gap: 6,
      textStyle: TextStyles.baseText.copyWith(fontWeight: FontWeight.w500),
      color: AppColors.black.withOpacity(0.4),
      activeColor: AppColors.black,
      tabs: _tabsList, // Your tab list
    );
  }

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
