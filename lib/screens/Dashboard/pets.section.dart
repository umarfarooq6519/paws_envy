import 'package:flutter/material.dart';
import 'package:paws_envy/config/utils/colors.dart';
import 'package:paws_envy/config/utils/text.styles.dart';
import 'package:paws_envy/models/pets.model.dart';
import 'package:paws_envy/widgets/purple_chip.dart';

class DashboardPetsSection extends StatelessWidget {
  const DashboardPetsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ##### Pet Section Header #####
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Your Pets', style: AppText.mediumHeading),
              Text('See All'),
            ],
          ),
        ),
        // ##### Pet Section List #####
        Container(
          height: 225,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: pets.length,
            itemBuilder: (context, index) {
              final pet = pets[index];
              return Container(
                width: 170,
                margin:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(35),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.lightPurple,
                      blurRadius: 8,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(pet.imageUrl),
                      radius: 55,
                    ),
                    const SizedBox(height: 10),
                    PurpleChip(text: pet.name),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
