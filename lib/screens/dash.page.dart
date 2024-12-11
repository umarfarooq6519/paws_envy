import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:paws_envy/config/utils/colors.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  List<Widget> iconBody = const [
    Icon(Icons.home),
    Icon(Icons.library_books),
    Icon(Icons.camera),
    Icon(Icons.pets),
    Icon(Icons.person),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
          backgroundColor: AppColors.purpleAccent,
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            ),
            IconButton(
              onPressed: () {},
              icon: const CircleAvatar(),
            ),
          ],
        ),
        body: Center(
          child: iconBody[_currentIndex],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: GNav(
            haptic: true,
            onTabChange: (int newIndex) {
              setState(
                () {
                  _currentIndex = newIndex;
                },
              );
            },
            tabBackgroundColor: AppColors.lightPurple,
            tabActiveBorder: Border.all(color: AppColors.gray, width: 1),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            gap: 8,
            tabs: const [
              GButton(
                icon: Icons.home_outlined,
                text: 'Home',
              ),
              GButton(
                icon: Icons.library_books_outlined,
                text: 'Community',
              ),
              GButton(
                icon: Icons.camera_outlined,
                text: 'Camera',
              ),
              GButton(
                icon: Icons.pets_outlined,
                text: 'Pets',
              ),
              GButton(
                icon: Icons.person_outline,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
