import 'package:flutter/material.dart';
import 'package:paws_envy/models/petcare.model.dart';
import 'package:paws_envy/utils/text.styles.dart';
import 'package:paws_envy/widgets/card_medium.dart';

class ServicesVeterinarians extends StatelessWidget {
  const ServicesVeterinarians({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // ~ Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Veterinarians',
                style: TextStyles.mediumHeading,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/pet_care_nearby');
                },
                child: Text(
                  'View All',
                  style: TextStyles.smallText,
                ),
              ),
            ],
          ),

          SizedBox(height: 4),

          // ~ Pet care nearby list
          // Column(
          //   children: petCareList.map(
          //     (petCare) {
          //       return CardMedium(petCare: petCare);
          //     },
          //   ).toList(),
          // )
        ],
      ),
    );
  }
}
