import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:paws_envy/services/auth.service.dart';

import 'package:paws_envy/utils/colors.styles.dart';
import 'package:paws_envy/screens/Camera/camera.screen.dart';
import 'package:paws_envy/screens/Community/community.screen.dart';
import 'package:paws_envy/screens/Dashboard/dashboard.screen.dart';
import 'package:paws_envy/screens/Pets/pet.screen.dart';
import 'package:paws_envy/screens/Services/services.screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  String? userImageUrl;
  User? user;

  final PageController _pageController = PageController();

  final List<Widget> _pages = const [
    Dashboard(),
    CommunityScreen(),
    CameraScreen(),
    ServicesScreen(),
    PetScreen(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onNavTabChange(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    // initializing auth model
    user = AuthService().currentUser;
    userImageUrl = user?.photoURL;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ### AppBar
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(LineIcons.bell),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
              onTap: AuthService().signOut,
              child: CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage(userImageUrl ??
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqx0dk_uNP23GT8VLdWej-tlkGZbfwUDuT5w&s'),
              ),
            ),
          ),
        ],
      ),

      // ### Body
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          itemCount: _pages.length,
          onPageChanged: _onPageChanged,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return _pages[index];
          },
        ),
      ),

      // ### Bottom Nav
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(12, 6, 12, 12),
        decoration: BoxDecoration(
          color: AppColors.secondaryAccent,
        ),
        child: _bottomNavBar(),
      ),

      drawer: Drawer(),

      // ### FLoating Action Button
      floatingActionButton: _chatbotBtn(),
    );
  }

  // #######################

  GNav _bottomNavBar() {
    return GNav(
      selectedIndex: _currentIndex,
      onTabChange: _onNavTabChange,
      haptic: true,
      iconSize: 24,
      rippleColor: AppColors.white.withOpacity(0.5),
      tabBackgroundColor: AppColors.primaryAccent.withOpacity(1),
      tabBorderRadius: 22,
      tabActiveBorder: Border.all(color: Colors.black, width: 1),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      gap: 6,
      color: AppColors.black.withOpacity(0.5),
      activeColor: AppColors.black,
      tabs: _navList,
    );
  }

  Container _chatbotBtn() {
    return Container(
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

  List<GButton> get _navList {
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
        icon: LineIcons.heartbeat,
        text: 'Services',
      ),
      GButton(
        icon: LineIcons.paw,
        text: 'My Pets',
      ),
    ];
  }
}
