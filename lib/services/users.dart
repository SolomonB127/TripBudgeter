import 'package:cloud_firestore/cloud_firestore.dart';

class User_Profile {
  final String? userId;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final int? age;

  User_Profile({
    this.userId,
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.age,
  });

  static CollectionReference users = FirebaseFirestore.instance.collection('users');

  // Add or update user profile
  static Future<void> addUser(String userId, String email) async {
    try {
      // Set user data in Firestore using userId as the document ID
      await users.doc(userId).set({
        "userId": userId,
        "email": email,
        "firstName": '',  // Default values, can be updated later
        "lastName": '',
        "gender": '',
        "age": 0,
      }, SetOptions(merge: true));  // SetOptions allows merging with existing data if the doc exists
    } catch (e) {
      print("Failed to add user: $e");
    }
  }

  // Update user data
  static Future<void> updateUser(String userId, Map<String, dynamic> data) async {
    try {
      await users.doc(userId).update(data);
      print("User Updated");
    } catch (error) {
      print("Failed to update user: $error");
    }
  }

  // Delete user
  static Future<void> deleteUser(String userId) async {
    try {
      await users.doc(userId).delete();
      print("User Deleted");
    } catch (error) {
      print("Failed to delete user: $error");
    }
  }
}
