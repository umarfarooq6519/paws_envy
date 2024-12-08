import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:paws_envy/config/firebase/auth.model.dart';

import 'package:paws_envy/config/utils/colors.dart';
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

  Future<void> handleSignOut(context) async {
    await AuthModel().signOut();
    // Navigator.pushNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.purpleAccent,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(user?.email ?? 'Signed Out'),
              const Text(
                'Welcome, Umar',
                style: TextStyles.xLargeHeading,
              ),
              const Text(
                'Please define your role to continue',
                style: TextStyles.mediumText,
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    PrimaryBtn(onPressed: () {}, text: 'Pet Owner'),
                    const SizedBox(height: 15),
                    SecondaryBtn(onPressed: () {}, text: 'Veterinarian'),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  '*As a veterinarian, we would prompt you to provide your certification.',
                  style: TextStyles.smallText,
                  textAlign: TextAlign.center,
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  handleSignOut(context);
                },
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
