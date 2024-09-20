import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  bool obscure = true;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0).w,
        child: Column(
          children: [
            Image.asset("assets/images/signin.png"),
            Text("Sign in"),
            Text("Please login to continue to account"),
            SizedBox(child: TextFormField(
              decoration: InputDecoration(
                
              ),
            ),)
          ],
        ),
      ),
    );
  }
}
