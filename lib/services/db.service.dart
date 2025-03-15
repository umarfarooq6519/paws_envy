import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:uuid/uuid.dart';

final uuid = Uuid();

class DBservice {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addPetToFirestore(
      String name,
      String age,
      String breed,
      String bio,
      String gender,
      String isVaccinated,
      String activity,
      String condition,
      String energyLevel) async {
    // get current user info
    final String userID = _auth.currentUser!.uid;
    final String? userName = _auth.currentUser!.displayName;
    final String? userEmail = _auth.currentUser!.email;
    final String? userAvatar = _auth.currentUser!.photoURL;

    final String petID = uuid.v4(); // generate unique pet ID

    // form a pet object
    final pet = <String, dynamic>{
      'userID': userID,
      'userName': userName,
      'userEmail': userEmail,
      'userAvatar': userAvatar,
      'name': name,
      'age': age,
      'breed': breed,
      'bio': bio,
      'gender': gender,
      'isVaccinated': isVaccinated,
      'activity': activity,
      'condition': condition,
      'energyLevel': energyLevel,
    };

    print('Trying to add pet to firestore');

    await _db
        .collection("pets")
        .add(pet)
        .onError(
          (e, _) => throw Exception("Error saving pet to Firestore: $e"),
        )
        .then((e) {
      print('Pet added to firestore');
    });
  }

  Future<List<Map<String, dynamic>>> fetchUserPets() async {
    final String userID = _auth.currentUser!.uid;

    try {
      QuerySnapshot querySnapshot =
          await _db.collection("pets").where("userID", isEqualTo: userID).get();

      List<Map<String, dynamic>> pets = querySnapshot.docs
          .map(
              (doc) => {"petID": doc.id, ...doc.data() as Map<String, dynamic>})
          .toList();

      return pets;
    } catch (e) {
      throw Exception("Error fetching user's pets: $e");
    }
  }
}
