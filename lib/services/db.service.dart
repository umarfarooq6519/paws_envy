import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';
import 'package:timeago/timeago.dart' as timeago;

final uuid = Uuid();

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _db = FirebaseFirestore.instance;

// get current user info
final String userID = _auth.currentUser!.uid;
final String? userName = _auth.currentUser!.displayName;
final String? userEmail = _auth.currentUser!.email;
final String? userAvatar = _auth.currentUser!.photoURL;

class DBservice {
  Future<void> addPetToFirestore(Map<String, dynamic> petInfo) async {
    final String petID = uuid.v4();

    // Merge user details into petInfo
    final pet = {
      ...petInfo, // Spread existing petInfo
      'petID': petID,
      'userID': userID,
      'userName': userName,
      'userEmail': userEmail,
      'userAvatar': userAvatar,
    };

    print('Trying to add pet to firestore');

    await _db
        .collection("pets")
        .doc(petID)
        .set(pet)
        .onError(
          (e, _) => throw Exception("Error saving pet to Firestore: $e"),
        )
        .then((e) {
      print('Pet added to firestore');
    });
  }

  Future<void> removePetFromFirestore(String petID) async {
    try {
      await _db.collection('pets').doc(petID).delete();
      await _db.collection('lost_found').doc(petID).delete();
      await _db.collection('adoption_listing').doc(petID).delete();
      print('Pet removed');
    } catch (e) {
      throw Exception("Error removing pet: $e");
    }
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

  Future<void> markPetAsLost(Map<String, dynamic> petProfile) async {
    print('Trying to mark pet as lost');

    final now = Timestamp.now();

    petProfile['lostAt'] = now;

    await _db
        .collection('lost_found')
        .doc(petProfile['petID'])
        .set(petProfile)
        .then((e) {
      print('Pet marked as Lost');
    });
  }

  Future<void> markPetForAdoption(Map<String, dynamic> petProfile) async {
    print('Trying to mark pet for adoption');

    final now = Timestamp.now();

    petProfile['lostAt'] = now;

    await _db
        .collection('adoption_listing')
        .doc(petProfile['petID'])
        .set(petProfile)
        .then((e) {
      print('Pet marked for adoption');
    });
  }

  Future<List<Map<String, dynamic>>> fetchLostFound() async {
    try {
      QuerySnapshot querySnapshot = await _db.collection("lost_found").get();

      List<Map<String, dynamic>> pets = querySnapshot.docs
          .map(
              (doc) => {"petID": doc.id, ...doc.data() as Map<String, dynamic>})
          .toList();

      return pets;
    } catch (e) {
      throw Exception("Error fetching user's pets: $e");
    }
  }

  Future<List<Map<String, dynamic>>> fetchAdoptionListing() async {
    try {
      QuerySnapshot querySnapshot =
          await _db.collection("adoption_listing").get();

      List<Map<String, dynamic>> pets = querySnapshot.docs
          .map(
              (doc) => {"petID": doc.id, ...doc.data() as Map<String, dynamic>})
          .toList();

      return pets;
    } catch (e) {
      throw Exception("Error fetching user's pets: $e");
    }
  }

  Future<void> removePetFromLostFound(String petID) async {
    try {
      await _db.collection('lost_found').doc(petID).delete();
      print('Pet removed from Lost & Found');
    } catch (e) {
      throw Exception("Error removing pet: $e");
    }
  }

  Future<void> removePetFromAdoption(String petID) async {
    try {
      await _db.collection('adoption_listing').doc(petID).delete();
      print('Pet removed from adoption');
    } catch (e) {
      throw Exception("Error removing pet: $e");
    }
  }

  Future<void> addForumPost(String title, String details) async {
    final String forumID = uuid.v4();

    Map<String, String> post = {
      "forumID": forumID,
      'userID': userID,
      'userName': userName!,
      'title': title,
      'details': details,
    };

    print('Trying to post forum');

    await _db.collection('forum_posts').doc(forumID).set(post).then((e) {
      print('Forum posted!');
    });
  }

  Future<List<Map<String, dynamic>>> fetchForumPosts() async {
    try {
      QuerySnapshot querySnapshot = await _db.collection("forum_posts").get();

      List<Map<String, dynamic>> pets = querySnapshot.docs
          .map((doc) =>
              {"forumID": doc.id, ...doc.data() as Map<String, dynamic>})
          .toList();

      return pets;
    } catch (e) {
      throw Exception("Error fetching forums: $e");
    }
  }

  Future<void> removeForumPost(String forumID) async {
    try {
      await _db.collection('forum_posts').doc(forumID).delete();
      print('forum removed!');
    } catch (e) {
      throw Exception("Error removing pet: $e");
    }
  }

  Future<void> updateUserRole(String userID, String newRole) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(userID).update({
        'role': newRole,
      });
      print("User role updated to $newRole");
    } catch (e) {
      print("Error updating user role: $e");
    }
  }

  Future<void> addServiceToFirestore(Map<String, dynamic> service) async {
    try {
      await FirebaseFirestore.instance.collection('services').add(service);
      print("Service added successfully");
    } catch (e) {
      print("Error adding service: $e");
    }
  }
}
