import 'package:flutter/material.dart';
import 'package:paws_envy/models/services.model.dart';

import 'package:paws_envy/config/utils/colors.dart';
import 'package:paws_envy/config/utils/text.styles.dart';

class DashboardServicesSection extends StatelessWidget {
  const DashboardServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ##### Services Header #####
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pet Services',
                style: AppText.mediumHeading,
              ),
              Text('See All')
            ],
          ),
        ),
        const SizedBox(height: 8),
        // ##### Services List  #####
        SizedBox(
          height: 54,
          child: ListView.builder(
            itemCount: services.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Chip(
                  padding: const EdgeInsets.all(12),
                  label: Text(services[index].name),
                  avatar: services[index].icon,
                  iconTheme: const IconThemeData(size: 24),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(color: AppColors.gray),
                  ),
                  labelStyle: AppText.baseText,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
