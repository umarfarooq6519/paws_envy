import 'package:flutter/material.dart';
import 'package:paws_envy/services/db.service.dart';
import 'package:paws_envy/utils/colors.styles.dart';
import 'package:paws_envy/utils/shadow.styles.dart';
import 'package:paws_envy/utils/text.styles.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  final DBservice _db = DBservice();

  final List<String> categories = ["Lost & Found", "Pet Adoption"];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            children: [
              Text('Community',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Text('Connect, Share, and Care for Paws!',
                  textAlign: TextAlign.center),
            ],
          ),
        ),

        // Category Chips
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(categories.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ChoiceChip(
                  checkmarkColor: Colors.white,
                  label: Text(categories[index]),
                  selected: selectedIndex == index,
                  onSelected: (bool selected) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  selectedColor:
                      Theme.of(context).colorScheme.primary.withOpacity(0.8),
                  // backgroundColor: Colors.grey[200],
                  labelStyle: TextStyle(
                      color:
                          selectedIndex == index ? Colors.white : Colors.black),
                ),
              );
            }),
          ),
        ),

        SizedBox(height: 10),

        // Content Based on Selection
        Expanded(
          child: selectedIndex == 0
              ? _buildLostFoundSection()
              : _buildPetAdoptionSection(),
        ),
      ],
    );
  }

  Widget _buildLostFoundSection() {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _db.fetchLostFound(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No Pets Found'));
        }

        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final profile = snapshot.data![index];
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(),
                      Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            profile['name'],
                            style: TextStyles.smallHeading,
                          ),
                          Text("${profile['age']} yrs - ${profile['breed']}"),
                        ],
                      ),
                      Icon(
                        profile['gender'] == 'Male' ? Icons.male : Icons.female,
                      ),
                    ],
                  ),
                ));
          },
        );
      },
    );
  }

  Widget _buildPetAdoptionSection() {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _db.fetchAdoptionListing(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No Pets Found'));
        }

        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final profile = snapshot.data![index];
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(),
                      Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            profile['name'],
                            style: TextStyles.smallHeading,
                          ),
                          Text("${profile['age']} yrs - ${profile['breed']}"),
                        ],
                      ),
                      Icon(
                        profile['gender'] == 'Male' ? Icons.male : Icons.female,
                      ),
                    ],
                  ),
                ));
          },
        );
      },
    );
  }
}
