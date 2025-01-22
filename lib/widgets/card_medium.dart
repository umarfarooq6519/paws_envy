import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:paws_envy/models/petcare.model.dart';
import 'package:paws_envy/utils/colors.styles.dart';
import 'package:paws_envy/utils/shadow.styles.dart';
import 'package:paws_envy/utils/text.styles.dart';

class CardMedium extends StatelessWidget {
  const CardMedium({super.key, required this.petCare});

  final PetCare petCare;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: _containerDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _petCareAvatar(petCare),
                  SizedBox(width: 10),
                  _petCareDetails(petCare),
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: Icon(LineIcons.verticalEllipsis),
              ),
            ],
          ),
          SizedBox(height: 10),
          // pet care tags
          _petCareTags(petCare),
        ],
      ),
    );
  }

  // #########################

  CircleAvatar _petCareAvatar(PetCare petCare) => CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(petCare.imageUrl),
      );

  Wrap _petCareTags(PetCare petCare) => Wrap(
        spacing: 5,
        children: petCare.tags
            .map(
              (tag) => Chip(
                padding: EdgeInsets.all(10),
                label: Text(tag),
                backgroundColor: AppColors.primaryAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            )
            .toList(),
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
