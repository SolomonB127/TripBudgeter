import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trip_budgeter/services/users.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code); // Rethrow for handling in the SignIn widget
    }
  }

  Future<UserCredential> signUp(String email, String password, String firstName,
      String lastName, String address, String gender, int age) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      // Add user profile after successful sign-up
      // _firebaseFirestore
      //     .collection("users")
      //     .doc(userCredential.user!.uid)
      //     .set({

      //     });
      await User_Profile.addUser(
          userCredential.user!.uid,
          userCredential.user!.email!,
          firstName,
          lastName,
          gender,
          address,
          age);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
