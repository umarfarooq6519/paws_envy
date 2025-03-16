import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:paws_envy/services/db.service.dart';

import 'package:paws_envy/utils/colors.styles.dart';
import 'package:paws_envy/utils/shadow.styles.dart';
import 'package:paws_envy/utils/text.styles.dart';
import 'package:paws_envy/widgets/pet_owner_card_medium.dart';

class PetCardLarge extends StatefulWidget {
  const PetCardLarge(
      {super.key, required this.petProfile, required this.currentUser});

  final Map<String, dynamic> petProfile;
  final User? currentUser;

  @override
  State<PetCardLarge> createState() => _PetCardLargeState();
}

class _PetCardLargeState extends State<PetCardLarge> {
  String? selectedValue;

  final DBservice _db = DBservice();

  void showLostFoundModal(BuildContext context) {
    final profile = widget.petProfile;

    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
                leading: Icon(Icons.pets),
                title: Text('Mark as Lost'),
                onTap: () {
                  _db.markPetAsLost(profile);
                  Navigator.pop(context);
                }),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('Mark as Found'),
              onTap: () {
                _db.removePetFromLostFound(profile['petID']);
                Navigator.pop(context);
                // Handle action
              },
            ),
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
              leading: Icon(Icons.cancel),
              title: Text('Remove from adoption'),
              onTap: () {
                _db.removePetFromAdoption(profile['petID']);
                Navigator.pop(context);
              },
            ),
            // ListTile(
            //   leading: Icon(Icons.cancel),
            //   title: Text('Cancel'),
            //   onTap: () => Navigator.pop(context),
            // ),
          ],
        );
      },
    );
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
            // SizedBox(
            //   width: double.infinity,
            //   height: 300,
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.circular(20),
            //     child: Image.asset(
            //       petProfile['imgURL'],
            //       fit: BoxFit.cover,
            //     ),
            //   ),
            // ),

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
                        widget.petProfile['name'],
                        style: TextStyles.mediumHeading,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () => showLostFoundModal(context),
                            child: Icon(Icons.menu),
                          ),
                          SizedBox(width: 10),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(widget.petProfile['gender'] == "Male"
                                ? Icons.male
                                : Icons.female),
                          ),
                        ],
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
                      text: widget.petProfile['bio'],
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
                      widget.petProfile['age'],
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
                      widget.petProfile['breed'],
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
                      Text(widget.petProfile['activity']),
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
                      Text(widget.petProfile['energyLevel']),
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
                      Text(widget.petProfile['condition']),
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
                      Text('${widget.petProfile['isVaccinated']}'),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 8),

            // Pet Owner Card
            PetOwnerCardMedium(
              ownerName: widget.petProfile['userName'],
              ownerEmail: widget.petProfile['userEmail'],
              ownerAvatar: widget.petProfile['userAvatar'],
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
