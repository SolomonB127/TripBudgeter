import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_budgeter/constants/validators.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
        backgroundColor: const Color(0xffeaedf4),
        body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(12.0).w,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            34.verticalSpace,
            Image.asset("assets/images/sign up.png"),
            10.verticalSpace,
            Text(
              "Sign Up",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.sp),
            ),
            3.verticalSpace,
            Text(
              "Sign up to enjoy the full features of TripBudgeter",
              style: TextStyle(fontSize: 14.sp),
            ),
            20.verticalSpace,
            TextFormField(
              validator: Validators.validateName,
              decoration: InputDecoration(
                hintText: "Full Name",
                hintStyle: TextStyle(fontSize: 15.sp),
              ),
            ),
            12.verticalSpace,
            TextFormField(
              validator: Validators.validateEmail,
              decoration: InputDecoration(
                hintText: "Email",
                hintStyle: TextStyle(fontSize: 15.sp),
              ),
            ),
            12.verticalSpace,
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
            20.verticalSpace,
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                minimumSize:
                    WidgetStatePropertyAll(Size(double.infinity, 60.h)),
                textStyle: WidgetStatePropertyAll(
                  TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w500),
                ),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                backgroundColor: WidgetStatePropertyAll(
                  Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              child: const Text(
                "Sign Up",
                style: TextStyle(color: Colors.white),
              ),
            ),
            20.verticalSpace,
            Row(
              children: [
                const Expanded(
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                    "or",
                    style: TextStyle(fontSize: 18.sp),
                  ),
                ),
                const Expanded(
                  child: Divider(
                    thickness: 1,
                  ),
                ),
              ],
            ),
            10.verticalSpace,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: const WidgetStatePropertyAll(0),
                  backgroundColor: const WidgetStatePropertyAll(
                    Color.fromRGBO(244, 244, 244, 1),
                  ),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10).r,
                      side: BorderSide(
                        width: 1.0.w,
                        color: const Color.fromRGBO(55, 65, 81, 11),
                      ),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0.h),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      Image.asset("assets/images/google.png", height: 30.h),
                      20.horizontalSpace,
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
            ),
            6.verticalSpace,
          ]),
        ));
  }
}
