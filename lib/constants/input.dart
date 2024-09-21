import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputFieldColumn extends StatelessWidget {
  const InputFieldColumn(
      {super.key,
      required this.controller,
      required this.label,
      required this.validator,
      required this.hintText,
      this.textInputType});

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String label;
  final String hintText;
  final TextInputType? textInputType;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        8.verticalSpace,
        TextFormField(
          validator: validator,
          keyboardType: textInputType,
          controller: controller,
          style: TextStyle(
            fontSize: 15.sp,
          ),
          decoration: InputDecoration(hintText: hintText),
        ),
      ],
    );
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    super.key,
    required this.text,
    required this.ctlr,
    required this.obscure,
    required this.validator,
    required this.toggleObscure,
  });

  final String text;
  final String? Function(String?) validator;
  final TextEditingController ctlr;
  final bool obscure;
  final VoidCallback toggleObscure;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: Theme.of(context).textTheme.titleLarge),
        8.verticalSpace,
        TextFormField(
          controller: ctlr,
          obscureText: obscure,
          validator: validator,
          obscuringCharacter: "*",
          decoration: InputDecoration(
            hintText: "**** **** ****",
            suffixIcon: IconButton(
              icon: Icon(
                obscure
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
              onPressed: toggleObscure,
            ),
          ),
        ),
      ],
    );
  }
}
