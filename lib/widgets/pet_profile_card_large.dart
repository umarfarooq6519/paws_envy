import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:line_icons/line_icons.dart';
import 'package:paws_envy/services/db.service.dart';
import 'package:paws_envy/utils/colors.styles.dart';
import 'package:paws_envy/utils/shadow.styles.dart';
import 'package:paws_envy/utils/text.styles.dart';
import 'package:paws_envy/widgets/pet_owner_card_medium.dart';

class PetProfileCardLarge extends StatefulWidget {
  const PetProfileCardLarge({
    super.key,
    required this.petProfile,
    required this.currentUser,
    required this.handlePetDelete,
  });

  final Map<String, dynamic> petProfile;
  final User? currentUser;
  final Function(String) handlePetDelete;

  @override
  State<PetProfileCardLarge> createState() => _PetProfileCardLargeState();
}

class _PetProfileCardLargeState extends State<PetProfileCardLarge> {
  String? selectedValue;

  final DBservice _db = DBservice();

  void showLostFoundModal(BuildContext context) {
    final profile = widget.petProfile;

    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return SafeArea(
          bottom: true,
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.pets),
                title: Text('Mark as Lost'),
                onTap: () {
                  _db.markPetAsLost(profile);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.search),
                title: Text('Mark as Found'),
                onTap: () {
                  _db.removePetFromLostFound(profile['petID']);
                  Navigator.pop(context);
                  // Handle action
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.volunteer_activism),
                title: Text('Mark for adoption'),
                onTap: () {
                  _db.markPetForAdoption(profile);
                  Navigator.pop(context);
                  // Handle action
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Remove from adoption'),
                onTap: () {
                  _db.removePetFromAdoption(profile['petID']);
                  Navigator.pop(context);
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(
                  Icons.cancel,
                  color: AppColors.error,
                ),
                title: Text(
                  'Delete pet',
                  style: TextStyles.smallHeading.copyWith(
                    color: AppColors.error,
                  ),
                ),
                onTap: () {
                  widget.handlePetDelete(profile['petID']);
                  Navigator.pop(context);
                },
              ),
              // SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  Map<String, dynamic> petProfile = {};

  @override
  void initState() {
    super.initState();
    setState(() {
      petProfile = widget.petProfile;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ######## pet card container
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.secondary),
        boxShadow: [ShadowStyles.mediumShadow],
        borderRadius: BorderRadius.circular(28),
      ),
      width: double.infinity,
      // ############ container content
      child: SingleChildScrollView(
        padding: EdgeInsets.all(14),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      petProfile['petGender'] == 'Male'
                          ? 'assets/images/cartoon_dog.jpg'
                          : 'assets/images/cartoon_cat.jpg',
                      fit: BoxFit.contain,
                      width: double.infinity,
                      height: 300,
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 0,
                    child: InkWell(
                      onTap: () => showLostFoundModal(context),
                      child: Icon(
                        Icons.more_vert,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 15),

            // pet details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        petProfile['name'],
                        style: TextStyles.mediumHeading,
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          petProfile['gender'] == "Male"
                              ? Icons.male
                              : Icons.female,
                        ),
                      ),
                    ],
                  ),

                  // pet info
                  TextField(
                    maxLines: null,
                    maxLength: null,
                    enabled: false,
                    style: TextStyles.baseText,
                    controller: TextEditingController(
                      text: petProfile['bio'],
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // age
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Age',
                      style: TextStyles.smallHeading,
                    ),
                    Text(
                      petProfile['age'],
                      style: TextStyles.dimText,
                    ),
                  ],
                ),

                SizedBox(
                  height: 50,
                  child: VerticalDivider(
                    color: AppColors.black.withOpacity(0.2), // Divider color
                    thickness: 1,
                    width: 50,
                  ),
                ),

                // breed
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Breed',
                      style: TextStyles.smallHeading,
                    ),
                    Text(
                      petProfile['breed'],
                      style: TextStyles.dimText,
                    ),
                  ],
                )
              ],
            ),

            SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 15),
              child: Row(
                children: [
                  Icon(LineIcons.basketballBall),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Favorite Activity',
                        style: TextStyles.smallHeading,
                      ),
                      Text(petProfile['activity']),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 15),
              child: Row(
                children: [
                  Icon(LineIcons.heartbeat),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Energy Level',
                        style: TextStyles.smallHeading,
                      ),
                      Text(petProfile['energyLevel']),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 15),
              child: Row(
                children: [
                  Icon(LineIcons.stethoscope),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Health Conditions',
                        style: TextStyles.smallHeading,
                      ),
                      Text(petProfile['condition']),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 15),
              child: Row(
                children: [
                  Icon(LineIcons.syringe),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Vaccinated',
                        style: TextStyles.smallHeading,
                      ),
                      Text('${petProfile['isVaccinated']}'),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 8),

            // Pet Owner Card
            PetOwnerCardMedium(
              ownerName: petProfile['userName'],
              ownerEmail: petProfile['userEmail'],
              ownerAvatar: petProfile['userAvatar'],
            ),
          ],
        ),
      ),
    );
  }

  // void showDropdownModal() {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (context) {
  //       return Padding(
  //         padding: EdgeInsets.all(16),
  //         child: buildDropdown(),
  //       );
  //     },
  //   );
  // }

  // Widget buildDropdown() {
  //   return DropdownButtonFormField<String>(
  //     value: selectedValue,
  //     decoration: InputDecoration(
  //       labelText: "Select an option",
  //       border: OutlineInputBorder(),
  //     ),
  //     items: ["Lost", "Found"].map((String item) {
  //       return DropdownMenuItem(
  //         value: item,
  //         child: Text(item),
  //       );
  //     }).toList(),
  //     onChanged: (value) {
  //       selectedValue = value;
  //     },
  //   );
  // }
}
