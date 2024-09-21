import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trip_budgeter/constants/validators.dart';
import 'package:trip_budgeter/pages/sign_in.dart';
import 'package:trip_budgeter/services/auth/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void signOut() {
    final authService = Provider.of<AuthService>(context, listen: false);
    authService.signOut();
    Navigator.pushAndRemoveUntil(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(
        builder: (context) => const SignIn(), // Replace with your splash page
      ),
      (Route<dynamic> route) => false, // Remove all previous routes
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text(
        "Logged out Successfully",
        style: TextStyle(color: Colors.white),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(onPressed: signOut, icon: const Icon(Icons.logout))
        ],
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.redAccent, // A slightly different shade
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the Home Page!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20), // Spacing
            ElevatedButton(
              onPressed: () {
                // You can add navigation or actions here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Button Pressed!')),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.red,
                backgroundColor: Colors.white, // Button text color
              ),
              child: const Text('Press Me'),
            ),
          ],
        ),
      ),
    );
  }
}
