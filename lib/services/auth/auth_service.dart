import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trip_budgeter/services/users.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      // Ensure user profile is added or updated after sign-in
      await User_Profile.addUser(
          userCredential.user!.uid, userCredential.user!.email!);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code); // Rethrow for handling in the SignIn widget
    }
  }

  Future<UserCredential> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      // Add user profile after successful sign-up
      await User_Profile.addUser(
          userCredential.user!.uid, userCredential.user!.email!);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }
}
