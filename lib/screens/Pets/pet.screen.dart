import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:paws_envy/utils/colors.styles.dart';
import 'package:paws_envy/utils/shadow.styles.dart';
import 'package:paws_envy/utils/text.styles.dart';
import 'package:paws_envy/widgets/pet_card_large.dart';

class PetScreen extends StatefulWidget {
  const PetScreen({super.key});

  @override
  State<PetScreen> createState() => _PetScreenState();
}

class _PetScreenState extends State<PetScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  final List<Map<String, dynamic>> _petProfiles = [
    {
      'title': 'Pet Profile 1',
      'content': 'This is the content for Pet Profile 1.',
    },
    {
      'title': 'Pet Profile 2',
      'content': 'This is the content for Pet Profile 2.',
    },
    {
      'title': 'Pet Profile 3',
      'content': 'This is the content for Pet Profile 3.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: _petProfiles.length,
      itemBuilder: (context, index) {
        final profile = _petProfiles[index];

        return PetCardLarge();
      },
    );
  }
}
