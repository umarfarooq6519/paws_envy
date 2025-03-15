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
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final result = await _auth.signInWithCredential(credential);

      // if new user then add to firestore
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

  Future<void> addUserToFirestore(
      String userID, String? userEmail, String? avatarUrl) async {
    final user = <String, dynamic>{
      'uid': userID,
      'email': userEmail,
      'avatarUrl': avatarUrl,
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
