import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:paws_envy/utils/shadow.styles.dart';

import 'package:paws_envy/utils/colors.styles.dart';
import 'package:paws_envy/utils/text.styles.dart';
import 'package:paws_envy/services/auth.service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? user;
  String? userImageUrl;
  String? userName;
  String? userEmail;

  // #### function to handle user signout
  Future<void> handleSignOut() async {
    await AuthService().signOut();
    if (mounted) {
      Navigator.pop(context);
    }
    print('User Signed Out');
  }

  @override
  void initState() {
    super.initState();
    // initializing auth model
    user = AuthService().currentUser;
    userImageUrl = user?.photoURL?.replaceFirst('s96-c', 's200-c');
    userName = user?.displayName;
    userEmail = user?.email;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  // ######### Profile Page ##########
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            // ~ Back Button
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 16),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      LineIcons.arrowLeft,
                      size: 20,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 0),
                  Text(
                    'Back',
                    style: TextStyles.smallHeading,
                  ),
                ],
              ),
            ),

            // #### User Information
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 45),
              child: Column(
                children: [
                  _userAvatar(userImageUrl),
                  const SizedBox(height: 12),
                  Text(
                    userName!,
                    style: TextStyles.mediumHeading,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    userEmail ?? 'No email available',
                    style: TextStyles.dimText,
                  ),
                ],
              ),
            ),

            // #### Settings List
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _settingsItem(
                      'General', LineIcons.cog, AppColors.black, () {}),
                  _settingsItem(
                      'Account', LineIcons.user, AppColors.black, () {}),
                  _settingsItem(
                      'Privacy', LineIcons.lock, AppColors.black, () {}),
                  _settingsItem(
                      'Notifications', LineIcons.bell, AppColors.black, () {}),
                  _settingsItem(
                      'Security', LineIcons.userShield, AppColors.black, () {}),
                  _settingsItem('Help & Support', LineIcons.headset,
                      AppColors.black, () {}),
                  _settingsItem(
                      'About', LineIcons.infoCircle, AppColors.black, () {}),
                  _settingsItem('Sign Out', LineIcons.alternateSignOut,
                      AppColors.error, handleSignOut)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ##################################

  Widget _settingsItem(
      String title, IconData icon, Color color, GestureTapCallback onTap) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [ShadowStyles.xSmallShadow],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          splashColor: AppColors.secondary.withOpacity(0.2),
          highlightColor: AppColors.secondary.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: ListTile(
              leading: Icon(
                icon,
                color: color,
              ),
              title: Text(
                title,
                style: TextStyle(color: color),
              ),
            ),
          ),
        ),
      ),
    );
  }

  CircleAvatar _userAvatar(String? userPhoto) {
    return CircleAvatar(
      backgroundImage: NetworkImage(userPhoto ?? 'https://bit.ly/3DEGQw8'),
      radius: 44,
    );
  }
}
