import 'package:expense_tracker/constatnts/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {this.icon,
      this.ontap,
      this.readonly = false,
      required this.obscure,
      required this.validator,
      required this.controller,
      required this.title,
      super.key});
  final IconButton? icon;
  final String title;
  final bool obscure;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final void Function()? ontap;
  final bool readonly;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: ontap,
      readOnly: readonly,
      controller: controller,
      obscureText: obscure,
      validator: validator,
      cursorColor: const Color.fromARGB(255, 120, 120, 120),
      decoration: InputDecoration(
        hintText: title,
        suffixIcon: icon,
        fillColor: Appcolor.tertiaryColor,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(width: 1, color: Appcolor.tertiaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(width: 1, color: Appcolor.tertiaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(width: 1, color: Appcolor.tertiaryColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(width: 1, color: Appcolor.tertiaryColor),
        ),
      ),
    );
  }
}
