import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:paws_envy/config/utils/shadow.styles.dart';
import 'package:provider/provider.dart';

import 'package:paws_envy/config/utils/colors.styles.dart';
import 'package:paws_envy/config/utils/text.styles.dart';
import 'package:paws_envy/config/firebase/auth.config.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final String blankProfile =
      'https://t3.ftcdn.net/jpg/05/70/71/06/360_F_570710660_Jana1ujcJyQTiT2rIzvfmyXzXamVcby8.jpg';

  Future<void> handleSignOut() async {
    await AuthModel().signOut();
    if (mounted) {
      Navigator.pop(context);
    }
    print('User Signed Out');
  }

  @override
  // ######### Profile Page ##########
  Widget build(BuildContext context) {
    return Consumer<AuthModel>(
      builder: (context, authModel, child) {
        final currentUser = authModel.currentUser;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.secondaryAccent,
            centerTitle: true,
            title: Text(
              'Profile',
              style: TextStyles.mediumHeading,
            ),
          ),
          body: ListView(
            children: [
              // ~ User Info
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 45),
                child: Column(
                  children: [
                    _userAvatar(currentUser?.photoURL),
                    const SizedBox(height: 12),
                    _nameText(currentUser?.displayName),
                    const SizedBox(height: 4),
                    _emailText(currentUser?.email),
                  ],
                ),
              ),

              // ~ Settings List
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _settingsItem(
                        'General', LineIcons.cog, AppColors.black, () {}),
                    _settingsItem(
                        'Account', LineIcons.user, AppColors.black, () {}),
                    _settingsItem(
                        'Privacy', LineIcons.lock, AppColors.black, () {}),
                    _settingsItem('Notifications', LineIcons.bell,
                        AppColors.black, () {}),
                    _settingsItem('Security', LineIcons.userShield,
                        AppColors.black, () {}),
                    _settingsItem('Help & Support', LineIcons.headset,
                        AppColors.black, () {}),
                    _settingsItem(
                        'About', LineIcons.infoCircle, AppColors.black, () {}),
                    _settingsItem('Sign Out', LineIcons.alternateSignOut,
                        AppColors.red, handleSignOut),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ##################################

  Widget _settingsItem(
          String title, IconData icon, Color color, GestureTapCallback onTap) =>
      Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.secondaryAccent,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [ShadowStyles.smallShadow],
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            splashColor: AppColors.secondary.withOpacity(0.5),
            highlightColor: AppColors.secondary,
            borderRadius: BorderRadius.circular(20),
            onTap: onTap,
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
      );

  CircleAvatar _userAvatar(String? userPhoto) => CircleAvatar(
        backgroundImage: NetworkImage(userPhoto ?? blankProfile),
        radius: 44,
      );

  Text _nameText(String? userName) => Text(
        userName ?? 'Name Not Set',
        style: TextStyles.mediumHeading.copyWith(
          fontWeight: FontWeight.w600,
        ),
      );

  Text _emailText(String? userEmail) => Text(
        userEmail ?? 'No email available',
        style: TextStyles.dimText,
      );
}
