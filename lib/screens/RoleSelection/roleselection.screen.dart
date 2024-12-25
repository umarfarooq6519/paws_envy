import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:paws_envy/config/firebase/auth.config.dart';
import 'package:paws_envy/config/utils/colors.styles.dart';
import 'package:paws_envy/config/utils/text.styles.dart';
import 'package:paws_envy/widgets/primary_btn.dart';
import 'package:paws_envy/widgets/secondary_btn.dart';

class RoleSelectionPage extends StatefulWidget {
  const RoleSelectionPage({super.key});

  @override
  State<RoleSelectionPage> createState() => _RoleSelectionPageState();
}

class _RoleSelectionPageState extends State<RoleSelectionPage> {
  final User? user = AuthModel().currentUser;
  get firstName => user?.displayName?.split(' ')[0];

  Future<void> handleSignOut() async {
    await AuthModel().signOut();
    print('User Signed Out');
  }

  @override
  // ##### Role Selection Screen #####
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.primaryAccent,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ~ header
              Text(
                'Welcome, $firstName',
                style: TextStyles.xLargeHeading,
              ),
              const Text(
                'Please define your role to continue',
                style: TextStyles.mediumText,
              ),

              const SizedBox(height: 30),

              // ~ content
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    _petOwnerButton(),
                    const SizedBox(height: 15),
                    _vetButton(),
                    const SizedBox(height: 10),
                    Text(
                      '*As a veterinarian, we would prompt you to provide your certification.',
                      style: TextStyles.smallText,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),

              // ~ footer
              _signoutBtn(),
            ],
          ),
        ),
      ),
    );
  }

  SecondaryBtn _vetButton() =>
      SecondaryBtn(onPressed: () {}, text: 'Veterinarian');

  PrimaryBtn _petOwnerButton() => PrimaryBtn(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/dash');
        },
        text: 'Pet Owner',
      );

  Widget _signoutBtn() => OutlinedButton(
        onPressed: () {
          handleSignOut();
        },
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.logout,
              size: 16,
            ),
            SizedBox(width: 8),
            Text(
              'Sign Out',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      );
}
