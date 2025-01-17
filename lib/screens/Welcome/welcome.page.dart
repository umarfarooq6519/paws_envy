import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:paws_envy/utils/colors.styles.dart';
import 'package:paws_envy/utils/constants.dart';
import 'package:paws_envy/utils/text.styles.dart';
import 'package:paws_envy/screens/Welcome/feature.section.dart';
import 'package:paws_envy/widgets/custom_divider.dart';
import 'package:paws_envy/widgets/google_btn.dart';
import 'package:paws_envy/widgets/primary_btn.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  // controller for slider
  final PageController _slideController = PageController();

  @override
  // ##### Welcome Screen #####
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // ~ logo section
          Container(
            color: AppColors.secondaryAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 50),
                // ##### header #####
                _lottieAnimation(),
                _appName(),
                _appSlogan(),
                const SizedBox(height: 40),
              ],
            ),
          ),

          // ~ content section
          Expanded(
            flex: 1,
            child: Container(
              decoration: _containerDecoration(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    // slider content
                    SizedBox(
                      height: 180,
                      child: PageView(
                        controller: _slideController,
                        children: featureCards,
                      ),
                    ),

                    const SizedBox(height: 40),
                    _emailField(),
                    const SizedBox(height: 15),
                    _continueBtn(),
                    const SizedBox(height: 25),
                    const CustomDivider(text: 'OR'),
                    const SizedBox(height: 25),
                    const GoogleBtn(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _appName() {
    return const Text(
      MyConstants.appName,
      style: TextStyles.mainHeading,
    );
  }

  Widget _appSlogan() {
    return const Text(
      MyConstants.appSlogan,
      style: TextStyles.mediumText,
      textAlign: TextAlign.center,
    );
  }

  Widget _lottieAnimation() {
    return Lottie.asset(
      'assets/animations/paws.json',
      height: 150,
      width: 150,
      repeat: false,
    );
  }

  BoxDecoration _containerDecoration() {
    return BoxDecoration(
      color: AppColors.white,
      border: Border.all(color: AppColors.gray),
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      ),
    );
  }

  Widget _emailField() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        hintText: 'Email',
      ),
    );
  }

  Widget _continueBtn() {
    return PrimaryBtn(onPressed: () {}, text: 'Continue');
  }
}
