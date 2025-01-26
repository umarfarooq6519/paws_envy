import 'package:flutter/material.dart';

import 'package:paws_envy/utils/colors.styles.dart';
import 'package:paws_envy/utils/shadow.styles.dart';
import 'package:paws_envy/utils/text.styles.dart';
import 'package:paws_envy/models/pets.model.dart';

class DashboardPetsSection extends StatelessWidget {
  const DashboardPetsSection({super.key});

  @override
  // ##### Pet Profiles Section #####
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ~ header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _sectionHeader(context),
          ),
        ),

        const SizedBox(height: 6),

        // ~ content
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(8),
            itemCount: pets.length,
            itemBuilder: (context, index) {
              final pet = pets[index];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                width: 160,
                decoration: _cardDecoration(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _petAvatar(pet),
                    const SizedBox(height: 5),
                    _petLabel(pet),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  // ############################
  List<Widget> _sectionHeader(BuildContext context) {
    return [
      const Text(
        'Your Pets',
        style: TextStyles.mediumHeading,
      ),
      Text(
        'View All',
        style: TextStyles.smallText,
      ),
    ];
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(30),
      boxShadow: [
        ShadowStyles.smallShadow,
      ],
    );
  }

  Chip _petLabel(Pet pet) {
    return Chip(
      backgroundColor: AppColors.primaryAccent,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      label: Text(pet.name),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: AppColors.black, width: 1),
      ),
    );
  }

  CircleAvatar _petAvatar(Pet pet) {
    return CircleAvatar(
      radius: 44,
      backgroundImage: AssetImage(pet.imageUrl),
    );
  }
}
