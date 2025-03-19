import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  User? get currentUser => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      // Ensure previous sessions are cleared
      await googleSignIn.signOut();
      // await googleSignIn.disconnect();

      final GoogleAuthProvider googleProvider = GoogleAuthProvider();
      googleProvider.setCustomParameters({'prompt': 'select_account'});

      // Sign in and get user data
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) return; // User canceled login

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final result = await _auth.signInWithCredential(credential);

      // If new user, add to Firestore
      if (result.additionalUserInfo!.isNewUser) {
        addUserToFirestore(
            result.user!.uid, result.user!.email, result.user!.photoURL);
      }

      notifyListeners();
    } catch (e) {
      throw Exception('signInWithGoogle() error: $e');
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<String> getUserRole(String userID) async {
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userID)
          .get();

      if (userDoc.exists) {
        var data = userDoc.data() as Map<String, dynamic>;
        return data['role'] ?? "unknown"; // Defaults to "unknown" if null
      }
      return "unknown"; // User document does not exist
    } catch (e) {
      print("Error fetching user role: $e");
      return "unknown";
    }
  }

  Future<void> addUserToFirestore(
      String userID, String? userEmail, String? avatarUrl) async {
    final user = <String, dynamic>{
      'uid': userID,
      'email': userEmail,
      'avatarUrl': avatarUrl,
      'role': null,
    };

    print('Trying to add user to firestore');

    await _db
        .collection("users")
        .doc(userID)
        .set(user)
        .onError(
          (e, _) => throw Exception("Error saving user to Firestore: $e"),
        )
        .then((e) {
      print('User added to firestore');
    });
  }
}
