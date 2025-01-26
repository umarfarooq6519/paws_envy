import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:paws_envy/models/petcare.model.dart';
import 'package:paws_envy/utils/text.styles.dart';
import 'package:paws_envy/widgets/card_medium.dart';

class NearbyPetCare extends StatelessWidget {
  const NearbyPetCare({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      LineIcons.arrowLeft,
                      size: 22,
                    ),
                  ),
                  Text(
                    'Back',
                    style: TextStyles.smallHeading,
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pet Care Nearby',
                    style: TextStyles.mediumHeading,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.sort),
                        Text('Distance'),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: petCareList.map(
                  (petCare) {
                    return CardMedium(petCare: petCare);
                  },
                ).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
