import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:paws_envy/utils/shadow.styles.dart';
import 'package:provider/provider.dart';

import 'package:paws_envy/utils/colors.styles.dart';
import 'package:paws_envy/utils/text.styles.dart';
import 'package:paws_envy/config/auth.config.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<void> handleSignOut() async {
    await AuthConfig().signOut();
    if (mounted) {
      Navigator.pop(context);
    }
    print('User Signed Out');
  }

  @override
  // ######### Profile Page ##########
  Widget build(BuildContext context) {
    final user = context.watch<AuthConfig>().currentUser;
    final userImageUrl = user?.photoURL?.replaceFirst('s96-c', 's400-c');
    final userName = user?.displayName;
    final userEmail = user?.email;

    return Scaffold(
      body: ListView(
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

          // ~ User Info
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 45),
            child: Column(
              children: [
                _userAvatar(userImageUrl),
                const SizedBox(height: 12),
                _nameText(userName),
                const SizedBox(height: 4),
                _emailText(userEmail),
              ],
            ),
          ),

          // ~ Settings List
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _settingsItem('General', LineIcons.cog, AppColors.black, () {}),
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
                    AppColors.red, handleSignOut),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ##################################

  Widget _settingsItem(
          String title, IconData icon, Color color, GestureTapCallback onTap) =>
      Container(
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
        backgroundImage: NetworkImage(userPhoto ?? 'https://bit.ly/3DEGQw8'),
        radius: 44,
      );

  Text _nameText(String? userName) => Text(
        userName ?? 'Name Not Set',
        style: TextStyles.mediumHeading.copyWith(
          fontWeight: FontWeight.w700,
        ),
      );

  Text _emailText(String? userEmail) => Text(
        userEmail ?? 'No email available',
        style: TextStyles.dimText,
      );
}
