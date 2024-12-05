import 'package:flutter/material.dart';
import 'package:paws_envy/config/utils/colors.dart';
import 'package:paws_envy/config/utils/text.styles.dart';
import 'package:paws_envy/widgets/primary_btn.dart';
import 'package:paws_envy/widgets/secondary_btn.dart';

class RoleSelectionPage extends StatelessWidget {
  const RoleSelectionPage({super.key});

  final String fullName = 'Umar Farooq';
  String get firstName => fullName.split(' ')[0];

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
              Text('Welcome, $firstName', style: TextStyles.xLargeHeading),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
