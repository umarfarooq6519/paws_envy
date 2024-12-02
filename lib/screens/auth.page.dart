import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:paws_envy/config/utils/text.styles.dart';
import 'package:paws_envy/widgets/primary_btn.dart';
import 'package:paws_envy/widgets/secondary_btn.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      body: Column(
        children: [
          // custom image using expanded
          Expanded(
            flex: 1,
            child: Container(
              child: Lottie.asset(
                'assets/animations/pet_family.json',
                height: 400,
                width: 400,
                repeat: false,
              ),
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
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 180,
                        child: PageView(
                          controller: _pageController,
                          children: const [
                            FeatureCard(
                              title: 'Shared Pet Profiles',
                              description:
                                  'Share and manage pet details with family members. Coordinate care routines and updates seamlessly.',
                            ),
                            FeatureCard(
                              title: 'AI-Powered Pet Care',
                              description:
                                  'Get personalized pet care suggestions tailored to your needs. From health advice to activity suggestions.',
                            ),
                            FeatureCard(
                              title: 'Chatbot for Assistance',
                              description:
                                  'Instant access, AI-powered assistance for pet care queries and support. Get reliable answers at any time.',
                            ),
                          ],
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
                      PrimaryBtn(
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        text: 'Sign Up',
                      ),
                      const SizedBox(height: 15),
                      SecondaryBtn(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        text: 'Log In',
                      ),
                    ],
                  ),
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
