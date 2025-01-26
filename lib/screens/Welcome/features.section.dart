import 'package:flutter/material.dart';
import 'package:paws_envy/utils/text.styles.dart';

class WelcomeFeatureCard extends StatelessWidget {
  final String title;
  final String description;

  const WelcomeFeatureCard({
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

final List<WelcomeFeatureCard> featureCards = [
  const WelcomeFeatureCard(
    title: 'Shared Pet Profiles',
    description:
        'Share and manage pet details with family members. Coordinate care routines and updates seamlessly.',
  ),
  const WelcomeFeatureCard(
    title: 'AI-Powered Pet Care',
    description:
        'Get personalized pet care suggestions tailored to your needs. From health advice to activity suggestions.',
  ),
  const WelcomeFeatureCard(
    title: 'Chatbot for Assistance',
    description:
        'Instant access, AI-powered assistance for pet care queries and support. Get reliable answers at any time.',
  ),
];
