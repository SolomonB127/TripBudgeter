import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffeaedf4),
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(12.0).w,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // 34.verticalSpace,
              Image.asset("assets/images/forgot-password.png"),
              // 10.verticalSpace,
              Text(
                "Forgot Password",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.sp),
              ),
              3.verticalSpace,
              Text(
                "Reset your password and make strong",
                style: TextStyle(fontSize: 14.sp),
              ),
            ])));
  }
}
