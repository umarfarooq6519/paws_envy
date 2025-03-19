import 'package:flutter/material.dart';
import 'package:paws_envy/services/db.service.dart';
import 'package:paws_envy/utils/colors.styles.dart';
import 'package:paws_envy/utils/shadow.styles.dart';
import 'package:paws_envy/utils/text.styles.dart';

class DashboardPetsSection extends StatelessWidget {
  final DBservice _db = DBservice();

  DashboardPetsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ~ header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Your Pets',
                style: TextStyles.mediumHeading,
              ),
              Text(
                'View All',
                style: TextStyles.smallText,
              ),
            ],
          ),
        ),

        const SizedBox(height: 6),

        // ~ content
        SizedBox(
          height: 220,
          child: FutureBuilder<List<Map<String, dynamic>>>(
            future: _db.fetchUserPets(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No Pets Added 😔'));
              }

              final pets = snapshot.data!;

              return ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(8),
                itemCount: pets.length,
                itemBuilder: (context, index) {
                  final petProfile = pets[index];
                  print('fetching pets: $petProfile');

                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    width: 180,
                    decoration: _cardDecoration(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            petProfile['petGender'] == 'Male'
                                ? 'assets/images/cartoon_dog.jpg'
                                : 'assets/images/cartoon_cat.jpg',
                            fit: BoxFit.contain,
                            width: 100,
                            height: 100,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Chip(
                          backgroundColor: AppColors.primaryAccent,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          label: Text(petProfile['name']),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: AppColors.border, width: 1),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                            '${petProfile['breed']} - ${petProfile['petGender']}')
                      ],
                    ),
                  );
                },
              );
            },
          ),
        )
      ],
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(30),
      boxShadow: [
        ShadowStyles.smallShadow,
      ],
    );
  }
}
