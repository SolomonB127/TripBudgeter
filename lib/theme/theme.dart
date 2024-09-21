import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData lightmode = ThemeData(
  colorScheme: const ColorScheme.light(
      surface: Color(0x00eaedf4),
      primary: Color.fromARGB(164, 125, 158, 236),
      inversePrimary: Color.fromARGB(255, 8, 83, 243),
      secondary: Color.fromARGB(230, 94, 108, 139)),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(
        color: const Color.fromRGBO(255, 255, 255, 1), fontSize: 16.sp),
    filled: true,
    errorStyle: TextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeight.w500,
      color: Colors.red,
    ),
    fillColor: const Color.fromARGB(255, 202, 202, 202),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10).r,
      borderSide: const BorderSide(color: Color.fromRGBO(50, 50, 50, 1)),
    ),
  ),
);
