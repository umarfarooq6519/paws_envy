import 'package:flutter/material.dart';
import 'package:paws_envy/models/petcare.model.dart';
import 'package:paws_envy/utils/colors.styles.dart';
import 'package:paws_envy/utils/shadow.styles.dart';
import 'package:paws_envy/utils/text.styles.dart';

class CardMedium extends StatelessWidget {
  const CardMedium({super.key, required this.petProfile});

  final Map<String, dynamic> petProfile;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: _containerDecoration(),
      child: Column(
        children: [],
      ),
    );
  }

  // #########################

  CircleAvatar _petCareAvatar(PetCare petCare) => CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(petCare.imageUrl),
      );

  BoxDecoration _containerDecoration() => BoxDecoration(
        color: AppColors.white,
        boxShadow: [ShadowStyles.smallShadow],
        borderRadius: BorderRadius.circular(38),
      );

  Column _petCareDetails(PetCare petCare) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            petCare.name,
            style: TextStyles.smallHeading,
          ),
          Text(
            '${petCare.distance} km | ${petCare.rating} ⭐',
            style: TextStyles.dimText,
          )
        ],
      );
}
