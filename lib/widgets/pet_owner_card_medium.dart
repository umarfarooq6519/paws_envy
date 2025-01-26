import 'package:flutter/material.dart';
import 'package:paws_envy/utils/colors.styles.dart';
import 'package:paws_envy/utils/text.styles.dart';

class PetOwnerCardMedium extends StatelessWidget {
  const PetOwnerCardMedium({
    super.key,
    required this.ownerName,
    required this.ownerLocation,
  });

  final String ownerName;
  final String ownerLocation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary),
        borderRadius: BorderRadius.circular(20),
      ),
      width: double.infinity,
      // height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/person_3.jpg'),
                radius: 28,
                backgroundColor: AppColors.primary,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ownerName,
                    style: TextStyles.smallHeading,
                  ),
                  Text(
                    "Pet Owner",
                    style: TextStyles.dimText,
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Location',
                style: TextStyles.smallHeading.copyWith(fontSize: 16),
              ),
              Text(
                'Lahore, Pakistan',
                style: TextStyles.dimText,
              ),
            ],
          )
        ],
      ),
    );
  }
}
