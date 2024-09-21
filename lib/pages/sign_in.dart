import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trip_budgeter/constants/validators.dart';
import 'package:trip_budgeter/pages/home.dart';
import 'package:trip_budgeter/services/auth/auth_service.dart';

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

  void signIn() async {
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      // Attempting to sign in
      await authService.signInWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );
    } catch (e) {
      // Show error in SnackBar
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
          e.toString(),
          style: TextStyle(color: Colors.white),
        )),
      );
      print("Sign-in error: $e"); // Additional logging for debugging
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeaedf4),
      resizeToAvoidBottomInset: true, // Prevents overflow when keyboard is open
      body: SafeArea(
        child: SingleChildScrollView(
          // Allows content to scroll when keyboard is open
          padding: const EdgeInsets.all(12.0).w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/signin.png"),
              Text(
                "Sign in",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.sp),
              ),
              SizedBox(height: 10.h),
              Text(
                "Please login to continue to account",
                style: TextStyle(fontSize: 16.sp),
              ),
              SizedBox(height: 20.h),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(fontSize: 15.sp),
                ),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                controller: passwordController,
                obscureText: obscure,
                validator: Validators.validatePassword,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(fontSize: 15.sp),
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                    onPressed: () {
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.black, fontSize: 15.sp),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              ElevatedButton(
                onPressed: signIn, // Sign in action
                style: ButtonStyle(
                  minimumSize:
                      WidgetStateProperty.all(Size(double.infinity, 60.h)),
                  textStyle: WidgetStateProperty.all(
                    TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w500),
                  ),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  backgroundColor: WidgetStateProperty.all(
                    Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                child: GestureDetector(
                  onTap: signIn,
                  child: const Text(
                    "Sign In",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  const Expanded(
                    child: Divider(thickness: 1),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text("or", style: TextStyle(fontSize: 18.sp)),
                  ),
                  const Expanded(
                    child: Divider(thickness: 1),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  elevation: WidgetStateProperty.all(0),
                  backgroundColor: WidgetStateProperty.all(
                    const Color.fromRGBO(244, 244, 244, 1),
                  ),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10).r,
                      side: BorderSide(
                        width: 1.0.w,
                        color: const Color.fromRGBO(55, 65, 81, 1),
                      ),
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0.h),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      Image.asset("assets/images/google.png", height: 30.h),
                      SizedBox(width: 20.w),
                      Text(
                        "Sign in with Google",
                        style: TextStyle(
                          color: const Color.fromRGBO(34, 34, 34, .9),
                          fontSize: 20.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Need an account?", style: TextStyle(fontSize: 20.sp)),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Create one",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Theme.of(context).colorScheme.inversePrimary,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.solid,
                        decorationColor:
                            Theme.of(context).colorScheme.inversePrimary,
                        decorationThickness: 2,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
