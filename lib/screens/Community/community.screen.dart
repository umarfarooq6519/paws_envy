import 'package:flutter/material.dart';
import 'package:paws_envy/models/petcare.model.dart';
import 'package:paws_envy/utils/text.styles.dart';
import 'package:paws_envy/screens/Community/community_chips.section.dart';
import 'package:paws_envy/widgets/card_medium.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  // ##### Community Screen #####
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Column(
            children: [
              // ~ header
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: _communityHeader(),
              ),

              // ~ content
              CommunityChips(),

              // community listing
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: petCareList.map((petCare) {
                    return CardMedium(petCare: petCare);
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // #######################

  Column _communityHeader() => Column(
        children: [
          Text(
            'Community',
            style:
                TextStyles.largeHeading.copyWith(fontWeight: FontWeight.w800),
          ),
          Text(
            'Connect, Share, and Care for Paws!',
            style: TextStyles.baseText,
            textAlign: TextAlign.center,
          ),
        ],
      );
}
