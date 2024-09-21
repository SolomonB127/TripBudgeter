import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trip_budgeter/components/splash_screen.dart';
import 'package:trip_budgeter/services/auth/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  late final TextEditingController firstNameController;
  late final TextEditingController addressController;
  late final TextEditingController ageController;
  late final TextEditingController lastNameController;

  String errorMessage = "";
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  String? selectedGender; // Variable to hold selected gender

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    firstNameController = TextEditingController();
    addressController = TextEditingController();
    ageController = TextEditingController();
    lastNameController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    firstNameController.dispose();
    addressController.dispose();
    ageController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  Future<bool> checkEmailExists(String email) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();
    return snapshot.docs.isNotEmpty; // Returns true if email exists
  }

  bool validateFields() {
    if (firstNameController.text.isEmpty) {
      setState(() {
        errorMessage = "First name is required.";
      });
      return false;
    }
    if (lastNameController.text.isEmpty) {
      setState(() {
        errorMessage = "Last name is required.";
      });
      return false;
    }
    if (emailController.text.isEmpty ||
        !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(emailController.text)) {
      setState(() {
        errorMessage = "Please enter a valid email.";
      });
      return false;
    }
    if (addressController.text.isEmpty) {
      setState(() {
        errorMessage = "Address is required.";
      });
      return false;
    }
    if (ageController.text.isEmpty ||
        int.tryParse(ageController.text) == null ||
        int.parse(ageController.text) < 16 ||
        int.parse(ageController.text) > 100) {
      setState(() {
        errorMessage = "You must be at least 16 to register.";
      });
      return false;
    }
    if (selectedGender == null) {
      setState(() {
        errorMessage = "Gender is required.";
      });
      return false;
    }
    if (passwordController.text.isEmpty || passwordController.text.length < 6) {
      setState(() {
        errorMessage = "Password must be at least 6 characters.";
      });
      return false;
    }
    if (confirmPasswordController.text != passwordController.text) {
      setState(() {
        errorMessage = "Passwords do not match.";
      });
      return false;
    }
    return true;
  }

  void signUp() async {
    final authService = Provider.of<AuthService>(context, listen: false);

    // Validate fields
    if (!validateFields()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            errorMessage,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
      return;
    }

    // Check if email already exists
    bool emailExists = await checkEmailExists(emailController.text);
    if (emailExists) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Email already in use. Please use a different email.",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
      return;
    }

    try {
      await authService.signUp(
        emailController.text,
        passwordController.text,
        firstNameController.text,
        lastNameController.text,
        addressController.text,
        selectedGender!, // Pass the selected gender
        int.parse(ageController.text),
      );

      // Navigate to HomePage after successful signup
      Navigator.pushAndRemoveUntil(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (context) =>
              const SplashScreen(), // Replace with your splash page
        ),
        (Route<dynamic> route) => false, // Remove all previous routes
      );
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            errorMessage,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeaedf4),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(12.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/sign up.png"),
              Text(
                "Sign Up",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.sp),
              ),
              SizedBox(height: 10.h),
              Text(
                "Create an account to get started",
                style: TextStyle(fontSize: 16.sp),
              ),
              SizedBox(height: 20.h),
              TextFormField(
                controller: firstNameController,
                decoration: InputDecoration(
                  hintText: "First Name",
                  hintStyle: TextStyle(fontSize: 15.sp),
                ),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                controller: lastNameController,
                decoration: InputDecoration(
                  hintText: "Last Name",
                  hintStyle: TextStyle(fontSize: 15.sp),
                ),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(fontSize: 15.sp),
                ),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                controller: addressController,
                decoration: InputDecoration(
                  hintText: "Address",
                  hintStyle: TextStyle(fontSize: 15.sp),
                ),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                controller: ageController,
                decoration: InputDecoration(
                  hintText: "Age",
                  hintStyle: TextStyle(fontSize: 15.sp),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 8.h),
              // Gender Dropdown
              DropdownButtonFormField<String>(
                value: selectedGender,
                hint: Text('Select Gender', style: TextStyle(fontSize: 15.sp)),
                items: <String>['Male', 'Female', 'Other']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedGender = newValue;
                  });
                },
              ),
              SizedBox(height: 8.h),
              TextFormField(
                controller: passwordController,
                obscureText: obscurePassword,
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(fontSize: 15.sp),
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              TextFormField(
                controller: confirmPasswordController,
                obscureText: obscureConfirmPassword,
                decoration: InputDecoration(
                  hintText: "Confirm Password",
                  hintStyle: TextStyle(fontSize: 15.sp),
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscureConfirmPassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                    onPressed: () {
                      setState(() {
                        obscureConfirmPassword = !obscureConfirmPassword;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              ElevatedButton(
                onPressed: signUp,
                style: ButtonStyle(
                  minimumSize:
                      MaterialStateProperty.all(Size(double.infinity, 60.h)),
                  textStyle: MaterialStateProperty.all(
                    TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w500),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",
                      style: TextStyle(fontSize: 20.sp)),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Theme.of(context).colorScheme.inversePrimary,
                        decoration: TextDecoration.underline,
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
