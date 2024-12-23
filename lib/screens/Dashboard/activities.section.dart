import 'package:flutter/material.dart';
import 'package:paws_envy/config/utils/colors.styles.dart';
import 'package:paws_envy/config/utils/text.styles.dart';
import 'package:paws_envy/models/activity.model.dart';

class DashboardActivitiesSection extends StatefulWidget {
  const DashboardActivitiesSection({super.key});

  @override
  State<DashboardActivitiesSection> createState() =>
      DashboardActivitiesSectionState();
}

class DashboardActivitiesSectionState
    extends State<DashboardActivitiesSection> {
  @override
  // ##### Pet Activities Section #####
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ~ header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: _sectionHeader(),
        ),

        // ~ content
        Column(
          children: activities.map((activity) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
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
          }).toList(),
        ),
      ],
    );
  }

  // ###########################

  Row _sectionHeader() {
    return Row(
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
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      boxShadow: const [
        BoxShadow(
          color: AppColors.primary,
          blurRadius: 10,
          spreadRadius: 0,
        )
      ],
      color: AppColors.white,
      borderRadius: BorderRadius.circular(40),
    );
  }

  Text _activityCardTitle(Activity activity) {
    return Text(
      activity.title,
      style: TextStyles.baseText.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text _activityCardDescription(Activity activity) {
    return Text(
      activity.time,
      style: TextStyles.dimText,
    );
  }

  Icon _iconLeft(Activity activity) {
    return Icon(
      activity.icon,
      size: 30,
      color: AppColors.black,
    );
  }

  CircleAvatar _avatarRight(Activity activity) {
    return CircleAvatar(
      radius: 25,
      backgroundImage: AssetImage(activity.imageUrl),
    );
  }
}
