import 'package:flutter/material.dart';
import 'package:paws_envy/utils/colors.styles.dart';
import 'package:paws_envy/utils/text.styles.dart';

class PetOwnerCardMedium extends StatelessWidget {
  const PetOwnerCardMedium({
    super.key,
    required this.ownerName,
    required this.ownerEmail,
    required this.ownerAvatar,
  });

  final String ownerName;
  final String ownerEmail;
  final String ownerAvatar;

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
                backgroundImage: NetworkImage(ownerAvatar),
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
                    ownerEmail,
                    style: TextStyles.dimText,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
