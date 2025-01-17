import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:paws_envy/utils/colors.styles.dart';
import 'package:paws_envy/utils/shadow.styles.dart';
import 'package:paws_envy/utils/text.styles.dart';

class CommunityListingSection extends StatefulWidget {
  const CommunityListingSection({super.key});

  @override
  State<CommunityListingSection> createState() =>
      _CommunityListingSectionState();
}

class _CommunityListingSectionState extends State<CommunityListingSection> {
  final List<Map<String, dynamic>> _communityChips = [
    {
      'icon': LineIcons.search,
      'label': 'Lost and Found',
    },
    {
      'icon': LineIcons.paw,
      'label': 'Pet Adoption',
    },
    {
      'icon': LineIcons.calendar,
      'label': 'Pet Events',
    },
    {
      'icon': LineIcons.list,
      'label': 'Forums',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // ~ Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pet Products',
                    style: TextStyles.mediumHeading,
                  ),
                  Text(
                    'View all',
                    style: TextStyles.smallText,
                  ),
                ],
              ),
              SizedBox(height: 4),
            ],
          ),
        ),

        // ~ Community Chips
        SizedBox(
          height: 160,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            itemCount: _communityChips.length,
            itemBuilder: (context, index) {
              final chip = _communityChips[index];

              return Container(
                width: 160,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  // border: Border.all(color: AppColors.black),
                  boxShadow: [ShadowStyles.xSmallShadow],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      chip['icon'],
                      size: 34,
                    ),
                    SizedBox(height: 10),
                    Text(
                      chip['label'],
                      style: TextStyles.baseHeading,
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
