import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'package:paws_envy/utils/colors.styles.dart';
import 'package:paws_envy/utils/shadow.styles.dart';
import 'package:paws_envy/utils/text.styles.dart';
import 'package:paws_envy/widgets/pet_owner_card_md.dart';

class PetCardLarge extends StatelessWidget {
  const PetCardLarge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [ShadowStyles.mediumShadow],
        borderRadius: BorderRadius.circular(30),
        // color: AppColors.secondary,
      ),
      width: double.infinity,
      child: ListView(
        padding: EdgeInsets.all(15),
        children: [
          SizedBox(
            width: double.infinity,
            height: 320,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/dog_1.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(height: 15),

          // pet details
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Bruce',
                      style: TextStyles.mediumHeading,
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(Icons.male),
                    )
                  ],
                ),

                // pet info
                TextField(
                  maxLines: null,
                  maxLength: null,
                  enabled: false,
                  style: TextStyles.baseText,
                  controller: TextEditingController(
                    text:
                        'Bruce is a mischievous and energetic [breed, if known] who loves to play fetch and explore the great outdoors. He has a big personality and an even bigger appetite for adventure!',
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // age
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Age',
                    style: TextStyles.smallHeading,
                  ),
                  Text(
                    '1 year',
                    style: TextStyles.dimText,
                  ),
                ],
              ),

              SizedBox(
                height: 50,
                child: VerticalDivider(
                  color: AppColors.black.withOpacity(0.2), // Divider color
                  thickness: 1,
                  width: 50,
                ),
              ),

              // breed
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Breed',
                    style: TextStyles.smallHeading,
                  ),
                  Text(
                    'Pitbull',
                    style: TextStyles.dimText,
                  ),
                ],
              )
            ],
          ),

          SizedBox(height: 30),

          Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 15),
            child: Row(
              children: [
                Icon(LineIcons.basketballBall),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Favorite Activity',
                      style: TextStyles.smallHeading,
                    ),
                    Text('Playing fetch'),
                  ],
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 15),
            child: Row(
              children: [
                Icon(LineIcons.heartbeat),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Energy Level',
                      style: TextStyles.smallHeading,
                    ),
                    Text('High Energy'),
                  ],
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 15),
            child: Row(
              children: [
                Icon(LineIcons.stethoscope),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Health Conditions',
                      style: TextStyles.smallHeading,
                    ),
                    Text('Allergic to wheat'),
                  ],
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 15),
            child: Row(
              children: [
                Icon(LineIcons.syringe),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Vaccination Status',
                      style: TextStyles.smallHeading,
                    ),
                    Text('Vaccinated 5 months ago'),
                  ],
                ),
              ],
            ),
          ),

          PetOwnerCardMedium()
        ],
      ),
    );
  }
}
