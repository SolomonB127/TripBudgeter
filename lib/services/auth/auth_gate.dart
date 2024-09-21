import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trip_budgeter/pages/home.dart';
import 'package:trip_budgeter/pages/onboarding.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return const HomePage(); // User is signed in
            } else {
              return const OnBoarding(); // User is not signed in
            }
          }
          return const Center(child: CircularProgressIndicator()); // Loading state
        },
      ),
    );
  }
}