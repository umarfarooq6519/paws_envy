import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  void handleSignOut(BuildContext context) {
    // Add your sign-out logic here
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(size: 28),
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: IconButton(
          onPressed: () {
            // Add your drawer/menu logic here
          },
          icon: const Icon(LineIcons.bars),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  // Add your notification logic here
                },
                icon: const Icon(LineIcons.bell),
              ),
              IconButton(
                onPressed: () {
                  handleSignOut(context);
                },
                icon: const CircleAvatar(
                  foregroundImage: AssetImage('assets/images/person_3.jpg'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
