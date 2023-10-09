import 'package:expense_tracker/constatnts/colors.dart';
import 'package:flutter/material.dart';

// class CustomTextField extends StatelessWidget {
//   CustomTextField(
//       {this.icon,
//       required this.validator,
//       required this.controller,
//       required this.title,
//       super.key});
//   final Icon? icon;
//   final String title;
//   String? Function(String?)? validator;
//   TextEditingController controller;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // height: 55,
//       // decoration: BoxDecoration(
//       //   color: const Color.fromARGB(136, 216, 216, 210),
//       //   borderRadius: BorderRadius.circular(40),
//       // ),
//       child: TextFormField(
//         controller: controller,
//         cursorColor: const Color.fromARGB(255, 120, 120, 120),
//         decoration: InputDecoration(
//             border: InputBorder.none,
//             contentPadding: const EdgeInsets.all(20),
//             labelText: title,
//             suffixIcon: icon),
//         validator: validator,
//       ),
//     );
//   }
// }
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {this.icon,
      required this.obscure,
      required this.validator,
      required this.controller,
      required this.title,
      super.key});
  final Icon? icon;
  final String title;
  bool obscure;
  String? Function(String?)? validator;
  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
          borderSide: BorderSide(width: 1, color: Appcolor.tertiaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(width: 1, color: Appcolor.tertiaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(width: 1, color: Appcolor.tertiaryColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(width: 1, color: Appcolor.tertiaryColor),
        ),
      ),
    );
  }
}
