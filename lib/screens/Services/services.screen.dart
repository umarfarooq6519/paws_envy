import 'package:flutter/material.dart';

import 'package:line_icons/line_icons.dart';
import 'package:paws_envy/config/utils/colors.styles.dart';
import 'package:paws_envy/config/utils/shadow.styles.dart';
import 'package:paws_envy/config/utils/text.styles.dart';
import 'package:paws_envy/models/petcare.model.dart';
import 'package:paws_envy/screens/Services/services_grid.section.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  // ##### Services Screen #####
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          // ~ Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: _servicesHeader(),
          ),

          // ~ Content
          ServicesGridSection(),
          SizedBox(height: 35),
          _petCareNearby()
        ],
      ),
    );
  }

  // ###################################

  Column _servicesHeader() => Column(
        children: [
          Text(
            'Services',
            style:
                TextStyles.largeHeading.copyWith(fontWeight: FontWeight.w800),
          ),
          Text(
            'Care, Love, and Tail-Wagging Happiness!',
            style: TextStyles.baseText,
            textAlign: TextAlign.center,
          ),
        ],
      );

  Padding _petCareNearby() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            // header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pet Care Nearby',
                  style: TextStyles.mediumHeading,
                ),
                Text(
                  'View all',
                  style: TextStyles.smallText,
                ),
              ],
            ),

            SizedBox(height: 4),

            // pet care nearby list
            Column(
              children: petCareList.map(
                (petCare) {
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
                },
              ).toList(),
            )
          ],
        ),
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
        color: AppColors.secondaryAccent,
        boxShadow: [ShadowStyles.smallShadow],
        borderRadius: BorderRadius.circular(38),
      );
}
