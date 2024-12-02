import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:paws_envy/config/utils/text.styles.dart';
import 'package:paws_envy/widgets/primary_btn.dart';
import 'package:paws_envy/widgets/secondary_btn.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // custom image using expanded
          const Expanded(
            flex: 1,
            child: Center(child: Text('Custom Image')),
          ),

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.purple[50],
                borderRadius: const BorderRadius.only(
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
                      SizedBox(
                        height: 250,
                        child: PageView(
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
                                  'Access instant, AI-powered assistance for pet care queries and support. Get reliable answers at any time.',
                            ),
                          ],
                        ),
                      ),
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
