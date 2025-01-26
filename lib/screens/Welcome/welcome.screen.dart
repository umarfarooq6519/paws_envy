import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:paws_envy/utils/colors.styles.dart';
import 'package:paws_envy/utils/constants.dart';
import 'package:paws_envy/utils/text.styles.dart';
import 'package:paws_envy/screens/Welcome/features.section.dart';
import 'package:paws_envy/widgets/google_btn.dart';
import 'package:paws_envy/widgets/primary_btn.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _slideController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _slideController.addListener(() {
      setState(() {
        _currentPage = _slideController.page?.round() ?? 0;
      });
    });
  }

  @override
  // ##### Welcome Screen #####
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // #### Header ####
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Column(
                children: [
                  _lottieAnimation(),
                  Text(
                    MyConstants.appName,
                    style: TextStyles.mainHeading,
                  ),
                  const Text(
                    MyConstants.appSlogan,
                    style: TextStyles.mediumText,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // ### Content ####
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                decoration: _containerDecoration(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // #### Slider Content
                    SizedBox(
                      height: 130,
                      child: PageView(
                        controller: _slideController,
                        children: featureCards,
                      ),
                    ),

                    const SizedBox(height: 14),

                    // ##### Slider Indicator
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == index
                                ? AppColors.black
                                : AppColors.lightGray,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    // #### Email Text Field
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Email',
                      ),
                    ),

                    const SizedBox(height: 15),

                    PrimaryBtn(onPressed: () {}, text: 'Continue'),

                    // #### Divider
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            height: 50,
                            indent: 30,
                            endIndent: 10,
                          ),
                        ),
                        Text(
                          'OR',
                          style: TextStyles.baseText,
                        ),
                        Expanded(
                          child: Divider(
                            height: 50,
                            indent: 10,
                            endIndent: 30,
                          ),
                        ),
                      ],
                    ),

                    const GoogleBtn(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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
      border: Border.all(color: AppColors.black),
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      ),
    );
  }
}
