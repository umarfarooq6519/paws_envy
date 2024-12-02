import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:paws_envy/config/utils/constants.dart';
import 'package:paws_envy/config/utils/text.styles.dart';
import 'package:paws_envy/widgets/primary_btn.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/animations/pet_family.json',
              height: 250,
              width: 250,
              repeat: false,
            ),

            // const SizedBox(height: 20),

            const Text(
              MyConstants.appName,
              style: TextStyles.mainHeading,
            ),
            const Text(
              MyConstants.appSlogan,
              style: TextStyles.largeText,
              textAlign: TextAlign.center,
            ),

            // const SizedBox(height: 30),

            // const TextField(
            //   decoration: InputDecoration(
            //     labelText: 'Username',
            //   ),
            // ),

            // const SizedBox(height: 10),

            // const TextField(
            //   obscureText: true,
            //   decoration: InputDecoration(
            //     labelText: 'Password',
            //   ),
            // ),

            const SizedBox(height: 40),

            PrimaryBtn(
              text: 'Get Started',
              onPressed: () {
                Navigator.pushNamed(context, '/auth');
              },
            ),
          ],
        ),
      ),
    );
  }
}
