import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function() onTap;
  const CustomButton({
    required this.title,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Appcolor.primaryColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.lato(
                fontSize: 25, fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class Cancelbutton extends StatelessWidget {
  final String title;
  final void Function() onTap;
  const Cancelbutton({
    required this.title,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Appcolor.white,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.lato(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: Appcolor.primaryColor),
          ),
        ),
      ),
    );
  }
}
