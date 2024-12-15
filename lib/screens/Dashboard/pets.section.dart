import 'package:flutter/material.dart';
import 'package:paws_envy/config/utils/colors.dart';
import 'package:paws_envy/config/utils/text.styles.dart';
import 'package:paws_envy/models/pets.model.dart';

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
        const SizedBox(height: 10),
        // ##### Pet Section List #####
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: pets.length,
            itemBuilder: (context, index) {
              final pet = pets[index];
              return Container(
                width: 170,
                margin: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(35),
                  border: Border.all(color: AppColors.border),
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      foregroundImage: AssetImage(pet.imageUrl),
                      radius: 55,
                    ),
                    const SizedBox(height: 10),
                    Chip(
                      backgroundColor: AppColors.lightPurple,
                      label: Text(pet.name, style: AppText.baseText),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: AppColors.border),
                      ),
                    ),
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
