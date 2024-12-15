import 'package:flutter/material.dart';
import 'package:paws_envy/models/activity.model.dart';

import 'package:paws_envy/config/utils/colors.dart';
import 'package:paws_envy/config/utils/text.styles.dart';

class DashboardActivitySection extends StatelessWidget {
  const DashboardActivitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _activityHeader(),
        _activityList(),
      ],
    );
  }

  Column _activityList() {
    // ##### Activity List #####
    return Column(
      children: activities.map((activity) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              // ##### Person Avatar #####
              const CircleAvatar(
                radius: 22,
                foregroundImage: AssetImage('assets/images/person_3.jpg'),
              ),

              const SizedBox(width: 10),

              // ##### Activity Card #####
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(
                      color: AppColors.border,
                    ),
                    borderRadius: BorderRadius.circular(25),
                    // boxShadow: const [
                    //   BoxShadow(
                    //     color: AppColors.lightPurple,
                    //     blurRadius: 8,
                    //     spreadRadius: 1,
                    //   )
                    // ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            activity.title,
                            style: AppText.smallHeading,
                          ),
                          Text(
                            activity.time,
                            style: AppText.dimText,
                          ),
                        ],
                      ),

                      CircleAvatar(
                        foregroundImage: AssetImage(activity.imageUrl),
                      )
                      //
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }).toList(),
    );
  }

  Padding _activityHeader() {
    // ##### Activity Header #####
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Recent Activity',
            style: AppText.mediumHeading,
          ),
          Text('See All')
        ],
      ),
    );
  }
}
