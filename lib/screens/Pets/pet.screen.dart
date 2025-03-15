// ignore_for_file: avoid_print

import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paws_envy/services/auth.service.dart';
import 'package:paws_envy/services/db.service.dart';
import 'package:paws_envy/utils/colors.styles.dart';
import 'package:paws_envy/utils/shadow.styles.dart';
import 'package:paws_envy/utils/text.styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:paws_envy/widgets/pet_card_large.dart';

class PetScreen extends StatefulWidget {
  const PetScreen({super.key});

  @override
  State<PetScreen> createState() => _PetScreenState();
}

class _PetScreenState extends State<PetScreen> {
  final DBservice _db = DBservice();
  final AuthService _auth = AuthService();

  User? currentUser;
  List<Map<String, dynamic>> _petProfiles = [];

  final PageController _petSliderController = PageController();

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController breedController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController activityController = TextEditingController();
  TextEditingController conditionController = TextEditingController();
  String? gender;
  String? isVaccinated;
  String? energyLevel;
  File? _selectedImage;

  Future<void> onPetSubmit() async {
    final String name = nameController.value.text;
    final String age = ageController.value.text;
    final String breed = breedController.value.text;
    final String bio = bioController.value.text;
    final String activity = activityController.value.text;
    final String condition = conditionController.value.text;

    if (name.isEmpty ||
        activity.isEmpty ||
        condition.isEmpty ||
        energyLevel == null ||
        age.isEmpty ||
        breed.isEmpty ||
        bio.isEmpty ||
        gender == null ||
        isVaccinated == null) {
      return;
    }

    print("Name: $name");
    print("Age: $age");
    print("Breed: $breed");
    print("Bio: $bio");
    print("Gender: $gender");
    print("Vaccinated: $isVaccinated");

    await _db
        .addPetToFirestore(name, age, breed, bio, gender!, isVaccinated!,
            activity, condition, energyLevel!)
        .then((e) {
      _fetchPets();

      Navigator.pop(context);
    });
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  Future<dynamic> _showPetModal() {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Add Pet Profile",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 15),

              // Image Picker
              Center(
                child: Column(
                  children: [
                    _selectedImage != null
                        ? Image.file(_selectedImage!,
                            height: 120, width: 120, fit: BoxFit.cover)
                        : Icon(Icons.image, size: 120, color: Colors.grey),
                    TextButton(
                      onPressed: _pickImage,
                      child: Text("Choose Image"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              // Pet Name Field
              TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: "Pet Name")),
              SizedBox(height: 10),

              // Bio Field (2 Lines)
              TextField(
                  controller: bioController,
                  decoration: InputDecoration(labelText: "Bio"),
                  maxLines: 2),
              SizedBox(height: 10),

              // Age & Breed Fields in a Row
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: ageController,
                      decoration: InputDecoration(labelText: "Age"),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                      child: TextField(
                          controller: breedController,
                          decoration: InputDecoration(labelText: "Breed"))),
                ],
              ),
              SizedBox(height: 10),

              // Favorite Activity Field
              TextField(
                  controller: activityController,
                  decoration: InputDecoration(labelText: "Favorite Activity")),
              SizedBox(height: 10),

              // Health Conditions Field
              TextField(
                  controller: conditionController,
                  decoration: InputDecoration(labelText: "Health Conditions")),
              SizedBox(height: 10),

              // Gender & Vaccination Fields in a Row
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: gender,
                      decoration: InputDecoration(labelText: "Gender"),
                      items: ["Male", "Female"].map((gender) {
                        return DropdownMenuItem(
                            value: gender, child: Text(gender));
                      }).toList(),
                      onChanged: (value) => setState(() => gender = value),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: isVaccinated,
                      decoration: InputDecoration(labelText: "Is Vaccinated?"),
                      items: ["Yes", "No"].map((status) {
                        return DropdownMenuItem(
                            value: status, child: Text(status));
                      }).toList(),
                      onChanged: (value) =>
                          setState(() => isVaccinated = value),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              // Energy Level Dropdown
              DropdownButtonFormField<String>(
                value: energyLevel,
                decoration: InputDecoration(labelText: "Energy Level"),
                items: ["Low", "Medium", "High"].map((level) {
                  return DropdownMenuItem(value: level, child: Text(level));
                }).toList(),
                onChanged: (value) => setState(() => energyLevel = value),
              ),
              SizedBox(height: 20),

              // Save Button
              ElevatedButton(onPressed: onPetSubmit, child: Text("Save")),
            ],
          ),
        );
      },
    );
  }

  void _fetchPets() async {
    List<Map<String, dynamic>> pets = await _db.fetchUserPets();

    setState(() {
      _petProfiles = pets;
    });
  }

  @override
  void initState() {
    super.initState();
    currentUser = _auth.currentUser;
    _fetchPets();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FutureBuilder<List<Map<String, dynamic>>>(
            future: _db.fetchUserPets(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return _newPetCard(context);
              }

              _petProfiles = snapshot.data!;

              return PageView.builder(
                pageSnapping: true,
                controller: _petSliderController,
                itemCount:
                    _petProfiles.length + 1, // +1 to add the "Add Pet" card
                itemBuilder: (context, index) {
                  if (index == _petProfiles.length) {
                    return _newPetCard(context);
                  }

                  final profile = _petProfiles[index];
                  return PetCardLarge(
                    petProfile: profile,
                    currentUser: currentUser,
                  );
                },
              );
            },
          ),
        ),

        // #### SmoothPageIndicator
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SmoothPageIndicator(
            controller: _petSliderController,
            count: _petProfiles.length + 1, // Include "Add Pet" widget in count
            effect: WormEffect(
              dotHeight: 10,
              dotWidth: 10,
              activeDotColor: Colors.purple.shade200,
              dotColor: Colors.grey.shade400,
            ),
          ),
        ),
      ],
    );
  }

  Container _newPetCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.secondary),
        boxShadow: [ShadowStyles.mediumShadow],
        borderRadius: BorderRadius.circular(28),
      ),
      margin: EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: _showPetModal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Add Pet',
                    style: TextStyles.btnText,
                  ),
                  SizedBox(width: 6),
                  Icon(
                    Icons.add,
                    size: 22,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
