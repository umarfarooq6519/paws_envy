import 'package:flutter/material.dart';
import 'package:paws_envy/utils/colors.styles.dart';
import 'package:paws_envy/utils/text.styles.dart';

class ServiceCard extends StatelessWidget {
  final String name;
  final String serviceType;
  final String time;
  final String? certified;

  const ServiceCard({
    super.key,
    required this.name,
    required this.serviceType,
    required this.time,
    required this.certified,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 3,
      color: AppColors.white,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.secondary, width: 1.5),
          borderRadius: BorderRadius.circular(17),
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CircleAvatar(
            //   backgroundImage: NetworkImage(imageUrl),
            //   radius: 28,
            // ),
            const SizedBox(width: 12),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyles.smallHeading,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.pets,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(serviceType, style: TextStyles.baseText),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            time,
                            style: TextStyles.dimText,
                          ),
                          certified == 'yes'
                              ? Chip(
                                  labelPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                  padding: EdgeInsets.all(0),
                                  label: Text('Certified'),
                                )
                              : SizedBox(), // Ensures Row maintains spacing
                        ],
                      )
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
