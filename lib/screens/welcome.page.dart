import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:paws_envy/config/utils/constants.dart';
import 'package:paws_envy/config/utils/text.styles.dart';
import 'package:paws_envy/widgets/custom_divider.dart';
import 'package:paws_envy/widgets/google_btn.dart';
import 'package:paws_envy/widgets/primary_btn.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      body: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 50),
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
                style: TextStyles.mediumText,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
            ],
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 180,
                      child: PageView(
                        controller: _slideController,
                        children: featureCards,
                      ),
                    ),
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
                                ? Colors.black87
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Email',
                      ),
                    ),
                    const SizedBox(height: 15),
                    PrimaryBtn(
                      onPressed: () {
                        Navigator.pushNamed(context, '/role');
                      },
                      text: 'Continue',
                    ),

                    // ##### google button #####
                    const SizedBox(height: 25),
                    const CustomDivider(text: 'OR'),
                    const SizedBox(height: 25),
                    const GoogleBtn()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final String title;
  final String description;

  const FeatureCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyles.mediumHeading,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: TextStyles.baseText,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

final List<FeatureCard> featureCards = [
  const FeatureCard(
    title: 'Shared Pet Profiles',
    description:
        'Share and manage pet details with family members. Coordinate care routines and updates seamlessly.',
  ),
  const FeatureCard(
    title: 'AI-Powered Pet Care',
    description:
        'Get personalized pet care suggestions tailored to your needs. From health advice to activity suggestions.',
  ),
  const FeatureCard(
    title: 'Chatbot for Assistance',
    description:
        'Instant access, AI-powered assistance for pet care queries and support. Get reliable answers at any time.',
  ),
];
