import 'package:flutter/material.dart';

import 'package:paws_envy/utils/colors.styles.dart';
import 'package:paws_envy/utils/text.styles.dart';
import 'package:paws_envy/models/activity.model.dart';

class DashboardActivitiesSection extends StatelessWidget {
  const DashboardActivitiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ~ header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: _sectionHeader(),
        ),

        SizedBox(height: 5),

        // ~ content
        Column(
          children: activities.map(
            (activity) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: _cardDecoration(),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Icon on the left
                    _iconLeft(activity),
                    const SizedBox(width: 14),
                    // Activity title and description
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _activityCardTitle(activity),
                          const SizedBox(height: 4),
                          _activityCardDescription(activity),
                        ],
                      ),
                    ),
                    _avatarRight(activity)
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ],
    );
  }

  // ###########################

  Row _sectionHeader() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Recent Activity',
            style: TextStyles.mediumHeading,
          ),
          Text(
            'View All',
            style: TextStyles.smallText,
          )
        ],
      );

  BoxDecoration _cardDecoration() => BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: AppColors.primary,
            blurRadius: 10,
            spreadRadius: 0,
          )
        ],
        color: AppColors.white,
        borderRadius: BorderRadius.circular(28),
      );

  Text _activityCardTitle(Activity activity) => Text(
        activity.title,
        style: TextStyles.baseText.copyWith(
          fontWeight: FontWeight.bold,
        ),
      );

  Text _activityCardDescription(Activity activity) => Text(
        activity.time,
        style: TextStyles.dimText,
      );

  Icon _iconLeft(Activity activity) => Icon(
        activity.icon,
        size: 30,
        color: AppColors.black,
      );

  CircleAvatar _avatarRight(Activity activity) => CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage(activity.imageUrl),
      );
}
