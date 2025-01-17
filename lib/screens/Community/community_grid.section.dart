import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paws_envy/utils/colors.styles.dart';
import 'package:paws_envy/utils/text.styles.dart';

class CommunityGridSection extends StatelessWidget {
  const CommunityGridSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 12),
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.1,
        children: [
          _communityCard(
            'Pet Adoption',
            'assets/icons/undraw_friends_xscy.svg',
          ),
          // _communityCard(
          //   'Lost and Found',
          //   'assets/icons/undraw_dog-walking_w27q.svg',
          // ),
          // _communityCard(
          //   'Pet Events',
          //   'assets/icons/undraw_doctors_djoj.svg',
          // ),
          // _communityCard(
          //   'Forumns',
          //   'assets/icons/undraw_breakfast_rgx5.svg',
          // ),
        ],
      ),
    );
  }

  Card _communityCard(String text, String imgPath) => Card(
        color: Colors.transparent,
        elevation: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(
                    color: AppColors.black.withOpacity(0.2), width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: SvgPicture.asset(
                imgPath,
                width: 115,
                height: 115,
              ),
            ),
            Text(
              text,
              style: TextStyles.mediumText,
            )
          ],
        ),
      );
}
