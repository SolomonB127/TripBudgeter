import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_budgeter/constants/validators.dart';

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
      backgroundColor: const Color(0xffeaedf4),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(12.0).w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("assets/images/signin.png"),
                  Text(
                    "Sign in",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30.sp),
                  ),
                  3.verticalSpace,
                  Text(
                    "Please login to continue to account",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                  20.verticalSpace,
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(fontSize: 15.sp),
                    ),
                  ),
                  8.verticalSpace,
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
                      6.verticalSpace,
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot Password?",
                          style:
                              TextStyle(color: Colors.black, fontSize: 15.sp),
                        ),
                      ),
                    ],
                  ),
                  9.verticalSpace,
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
                      "Sign In",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  6.verticalSpace,
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
                            Image.asset("assets/images/google.png",
                                height: 30.h),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Need an account",
                        style: TextStyle(fontSize: 20.sp),
                      ),
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
                  30.verticalSpace
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
