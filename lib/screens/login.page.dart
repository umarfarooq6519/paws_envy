import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:paws_envy/config/utils/text.styles.dart';
import 'package:paws_envy/widgets/custom_divider.dart';
import 'package:paws_envy/widgets/google_btn.dart';
import 'package:paws_envy/widgets/primary_btn.dart';
import 'package:paws_envy/config/utils/constants.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/animations/paws.json',
                  height: 150,
                  width: 150,
                  repeat: false,
                ),
                const Text(
                  MyConstants.appName,
                  style: TextStyles.mainHeading,
                ),
                const Text(
                  MyConstants.appSlogan,
                  style: TextStyles.largeText,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Stack(
                children: [
                  // ##### Back Button #####
                  Positioned(
                    top: 25,
                    left: 20,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios, size: 25),
                      onPressed: () {
                        Navigator.pop(
                            context); // Go back to the previous screen
                      },
                    ),
                  ),
                  // ##### Content #####
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // ##### Login Header #####
                        const Text('Login', style: TextStyles.largeHeading),
                        const SizedBox(height: 30),
                        // ##### Login Form #####
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: 'Email',
                          ),
                        ),
                        const SizedBox(height: 20),
                        // ##### Login Button #####
                        PrimaryBtn(onPressed: () {}, text: 'Continue'),
                        const SizedBox(height: 30),
                        // ##### Custom Divider #####
                        const CustomDivider(text: 'OR'),
                        // ##### Google Button #####
                        const SizedBox(height: 30),
                        const GoogleBtn(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
