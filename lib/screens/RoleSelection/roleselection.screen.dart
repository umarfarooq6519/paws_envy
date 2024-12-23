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

  Future<void> handleSignOut(context) async {
    await AuthModel().signOut();
    print('User Signed Out');
  }

  @override
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
              _heading(),
              _subHeading(),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    PrimaryBtn(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/dash');
                      },
                      text: 'Pet Owner',
                    ),
                    const SizedBox(height: 15),
                    SecondaryBtn(onPressed: () {}, text: 'Veterinarian'),
                    const SizedBox(height: 10),
                    _vetWarningMsg(),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              _signoutBtn(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _heading() {
    return Text(
      'Welcome, $firstName',
      style: TextStyles.xLargeHeading,
    );
  }

  Widget _subHeading() {
    return const Text(
      'Please define your role to continue',
      style: TextStyles.mediumText,
    );
  }

  Widget _vetWarningMsg() {
    return Text(
      '*As a veterinarian, we would prompt you to provide your certification.',
      style: TextStyles.smallText,
      textAlign: TextAlign.center,
    );
  }

  Widget _signoutBtn() {
    return OutlinedButton(
      onPressed: () {
        handleSignOut(context);
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
}
