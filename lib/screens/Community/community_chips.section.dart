import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:paws_envy/utils/colors.styles.dart';
import 'package:paws_envy/utils/shadow.styles.dart';
import 'package:paws_envy/utils/text.styles.dart';

class CommunityChips extends StatelessWidget {
  CommunityChips({super.key});

  final List<Map<String, dynamic>> _communityChips = [
    {
      'icon': LineIcons.search,
      'label': 'Lost and Found',
      'active': true,
    },
    {
      'icon': LineIcons.paw,
      'label': 'Pet Adoption',
      'active': false,
    },
    {
      'icon': LineIcons.calendar,
      'label': 'Pet Events',
      'active': false,
    },
    {
      'icon': LineIcons.list,
      'label': 'Pet Forums',
      'active': false,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 80,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            itemCount: _communityChips.length,
            itemBuilder: (context, index) {
              final chip = _communityChips[index];

              return Container(
                width: 210,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: chip['active']
                      ? AppColors.primaryAccent
                      : AppColors.white,
                  border: chip['active']
                      ? Border.all(color: AppColors.primary)
                      : null,
                  boxShadow: [ShadowStyles.xSmallShadow],
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      chip['icon'],
                      size: 28,
                    ),
                    SizedBox(width: 10),
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
