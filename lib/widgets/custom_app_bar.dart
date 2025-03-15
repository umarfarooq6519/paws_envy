import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'package:paws_envy/services/auth.service.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 15);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  User? user;
  String? userImageUrl;
  String? userName;

  @override
  void initState() {
    super.initState();
    // initializing auth model
    user = AuthService().currentUser;
    userImageUrl = user?.photoURL;
    userName = user?.displayName;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  // ##### Custom App Bar #####
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(left: 14, right: 14, bottom: 12),
        decoration: _appBarDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // ~ Leading Section
            // _leadingSection(userName),

            // ~ Actions Section
            _actionSection(userImageUrl, context),
          ],
        ),
      ),
    );
  }

  // ##############################

  BoxDecoration _appBarDecoration() {
    return BoxDecoration(
        // color: AppColors.secondaryAccent,
        // border: Border(
        //   bottom: BorderSide(
        //     color: AppColors.primary,
        //     width: 1,
        //   ),
        // ),
        // boxShadow: [ShadowStyles.xSmallShadow],
        );
  }

  Row _actionSection(String? userImageUrl, BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(LineIcons.bell),
          onPressed: () {},
        ),
        // const SizedBox(width: 8),
        // user avatar
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/profile');
          },
          child: CircleAvatar(
            radius: 26,
            backgroundImage: NetworkImage(userImageUrl ??
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqx0dk_uNP23GT8VLdWej-tlkGZbfwUDuT5w&s'),
          ),
        ),
      ],
    );
  }

  IconButton _leadingSection(String? userName) {
    return IconButton(
      onPressed: () {},
      icon: Icon(LineIcons.bars),
    );
  }
}
