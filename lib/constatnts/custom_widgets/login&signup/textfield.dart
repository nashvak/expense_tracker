import 'package:expense_tracker/constatnts/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {this.icon,
      this.ontap,
      this.type,
      this.readonly = false,
      required this.validator,
      required this.controller,
      required this.title,
      super.key});
  final Icon? icon;
  final String title;

  final String? Function(String?)? validator;
  final TextEditingController controller;
  final void Function()? ontap;
  TextInputType? type;
  final bool readonly;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: ontap,
      readOnly: readonly,
      controller: controller,
      validator: validator,
      keyboardType: type,
      cursorColor: const Color.fromARGB(255, 120, 120, 120),
      decoration: InputDecoration(
        hintText: title,
        prefixIcon: icon,
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
