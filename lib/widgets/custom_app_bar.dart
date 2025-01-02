import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  @override
  // ##### Custom App Bar #####
  Widget build(BuildContext context) {
    final user = context.watch<AuthModel>().currentUser;
    final userImageUrl = user?.photoURL;
    final userName = user?.displayName;

    return Container(
      padding: const EdgeInsets.only(left: 14, right: 14, bottom: 10),
      decoration: _appBarDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // ~ Leading Section
          _leadingSection(userName),

          // ~ Actions Section
          _actionSection(userImageUrl),
        ],
      ),
    );
  }

  BoxDecoration _appBarDecoration() => BoxDecoration(
        color: AppColors.primaryAccent,
        border: Border(
          bottom: BorderSide(
            color: AppColors.black.withOpacity(0.5),
            width: 0.5,
          ),
        ),
        boxShadow: [ShadowStyles.mediumShadow],
      );

  Row _actionSection(String? userImageUrl) => Row(
        children: [
          IconButton(
            icon: const Icon(LineIcons.bell),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
            child: CircleAvatar(
              radius: 24,
              backgroundImage:
                  NetworkImage(userImageUrl ?? 'https://bit.ly/3DEGQw8'),
            ),
          ),
        ],
      );

  Column _leadingSection(String? userName) => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hey,',
            style: TextStyles.smallText,
          ),
          Text(
            userName ?? 'Buddy',
            style: TextStyles.mediumHeading.copyWith(
              fontSize: 19,
            ),
          ),
        ],
      );
}
