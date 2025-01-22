import 'package:flutter/material.dart';

import 'package:paws_envy/utils/colors.styles.dart';
import 'package:paws_envy/utils/shadow.styles.dart';
import 'package:paws_envy/utils/text.styles.dart';
import 'package:paws_envy/models/services.model.dart';

class DashboardServicesSection extends StatelessWidget {
  const DashboardServicesSection({super.key});

  @override
  // ##### Pet Services Section #####
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ~ header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _sectionHeader(),
          ),
        ),

        const SizedBox(height: 6),

        // ~ content
        SizedBox(
          height: 70,
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: services.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final service = services[index];
              // card container
              return Container(
                width: 160,
                margin: const EdgeInsets.symmetric(horizontal: 12),
                decoration: _cardDecoration(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(service.icon),
                    const SizedBox(width: 6),
                    Text(
                      service.name,
                      style: TextStyles.baseHeading,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  List<Widget> _sectionHeader() => [
        const Text(
          'Pet Services',
          style: TextStyles.mediumHeading,
        ),
        Text(
          'View All',
          style: TextStyles.smallText,
        )
      ];

  BoxDecoration _cardDecoration() => BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [ShadowStyles.smallShadow],
      );
}
