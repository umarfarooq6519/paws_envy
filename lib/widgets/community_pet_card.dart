import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:paws_envy/utils/colors.styles.dart';
import 'package:paws_envy/utils/shadow.styles.dart';
import 'package:paws_envy/utils/text.styles.dart';
import 'package:timeago/timeago.dart' as timeago;

class CommunityPetCard extends StatelessWidget {
  const CommunityPetCard({super.key, required this.profile});

  final Map<String, dynamic> profile;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            ShadowStyles.smallShadow,
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        profile['petGender'] == 'Male'
                            ? 'assets/images/cartoon_dog.jpg'
                            : 'assets/images/cartoon_cat.jpg',
                        fit: BoxFit.contain,
                        width: 50,
                        height: 50,
                      ),
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              profile['name'],
                              style: TextStyles.smallHeading,
                            ),
                          ],
                        ),
                        Text("${profile['age']} yrs - ${profile['breed']}"),
                      ],
                    ),
                  ],
                ),
                Icon(
                  profile['gender'] == 'Male' ? Icons.male : Icons.female,
                ),
              ],
            ),
            SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    timeago.format(
                      (profile['lostAt'] as Timestamp).toDate(),
                    ),
                    style: TextStyles.dimText,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Contact Owner',
                    style: TextStyle(
                      color: Colors.deepPurple,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
