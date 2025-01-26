import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:paws_envy/widgets/pet_card_large.dart';
import 'package:paws_envy/widgets/pet_owner_card_medium.dart';

class PetScreen extends StatefulWidget {
  const PetScreen({super.key});

  @override
  State<PetScreen> createState() => _PetScreenState();
}

class _PetScreenState extends State<PetScreen> {
  final PageController _pageController = PageController();

  final List<Map<String, dynamic>> _petProfiles = [
    {
      'imgURL': 'assets/images/dog_1.jpg',
      'name': 'Bruce',
      'gender': Icons.male,
      'bio':
          'Bruce is a mischievous and energetic Pitbull who loves to play fetch and explore the great outdoors. He has a big personality and an even bigger appetite for adventure!',
      'age': '1 year',
      'breed': 'Pitbull',
      'activity': 'Playing Fetch',
      'energy': 'High Energy',
      'health': 'Allergic to Wheat',
      'vaccination': '5 months ago',
      'owner': PetOwnerCardMedium(
        ownerName: 'You',
        ownerLocation: 'Lahore, Pakistan',
      ),
    },
    {
      'imgURL': 'assets/images/dog_2.jpg',
      'name': 'Max',
      'gender': Icons.male,
      'bio':
          'Bruce is a mischievous and energetic Pitbull who loves to play fetch and explore the great outdoors. He has a big personality and an even bigger appetite for adventure!',
      'age': '1 year',
      'breed': 'Pitbull',
      'activity': 'Playing Fetch',
      'energy': 'High Energy',
      'health': 'Allergic to Wheat',
      'vaccination': '5 months ago',
      'owner': PetOwnerCardMedium(
        ownerName: 'You',
        ownerLocation: 'Lahore, Pakistan',
      ),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // #### Pets PageView
        Expanded(
          child: PageView.builder(
            pageSnapping: true,
            controller: _pageController,
            itemCount: _petProfiles.length,
            itemBuilder: (context, index) {
              final profile = _petProfiles[index];

              return PetCardLarge(
                petProfile: _petProfiles[index],
              );
            },
          ),
        ),

        // #### SmoothPageIndicator
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SmoothPageIndicator(
            controller: _pageController,
            count: _petProfiles.length,
            effect: WormEffect(
              dotHeight: 10,
              dotWidth: 10,
              activeDotColor: Colors.purple.shade200,
              dotColor: Colors.grey.shade400,
            ), // Customize effect as needed
          ),
        ),
      ],
    );
  }
}
