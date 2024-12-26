import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:paws_envy/config/firebase/auth.config.dart';
import 'package:paws_envy/config/utils/colors.styles.dart';
import 'package:paws_envy/config/utils/shadow.styles.dart';
import 'package:paws_envy/config/utils/text.styles.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);
}

class _CustomAppBarState extends State<CustomAppBar> {
  // function to handle signout
  Future<void> handleSignOut() async {
    await AuthModel().signOut();
    print('User Signed Out');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: _appBarDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ~ Leading Section
            _leadingSection(),

            // ~ Actions Section
            _actionSection(),
          ],
        ),
      ),
    );
  }

  BoxDecoration _appBarDecoration() => const BoxDecoration(
        color: AppColors.primaryAccent,
        boxShadow: [ShadowStyles.mediumShadow],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      );

  Row _actionSection() => Row(
        children: [
          IconButton(
            icon: const Icon(LineIcons.bell),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () => handleSignOut(),
            child: const CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage('assets/images/person_3.jpg'),
            ),
          ),
        ],
      );

  Column _leadingSection() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hey,',
            style: TextStyles.smallText,
          ),
          Text(
            'Umar Farooq',
            style: TextStyles.mediumHeading.copyWith(
              fontSize: 19,
            ),
          ),
        ],
      );
}
