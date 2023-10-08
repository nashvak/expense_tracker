import 'package:flutter/material.dart';

import '../../constatnts/colors.dart';
import 'sizedbox.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({this.icon, required this.title, super.key});
  final Icon? icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: const Color.fromARGB(136, 216, 216, 210),
        borderRadius: BorderRadius.circular(40),
      ),
      child: TextFormField(
        cursorColor: const Color.fromARGB(255, 120, 120, 120),
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(20),
            hintText: title,
            suffixIcon: icon),
      ),
    );
  }
}

class BottomText extends StatelessWidget {
  const BottomText(
      {required this.title,
      required this.title2,
      required this.ontap,
      super.key});
  final String title;
  final String title2;
  final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: titleStyle()),
        GestureDetector(
          onTap: ontap,
          child: Text(
            title2,
            style: titleStyle().copyWith(color: Appcolor.primaryColor),
          ),
        ),
      ],
    );
  }
}
