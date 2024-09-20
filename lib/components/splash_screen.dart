import 'package:flutter/material.dart';
import 'package:trip_budgeter/main.dart';
import 'package:trip_budgeter/pages/home.dart';
import 'package:trip_budgeter/pages/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Simulate a delay before navigating to the next screen (MainApp)
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnBoarding()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background color of the splash screen
      body: Center(
          child: Column(
        children: [
          Image.asset("assets/images/Logo.png"),
        ],
      )),
    );
  }
}
