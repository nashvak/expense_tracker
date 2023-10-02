import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../custom_widgets/sizedbox.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 25, right: 25, top: 100, bottom: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'images/expense-logo.png',
            ),
            Text(
              "Welcome",
              style: GoogleFonts.gabriela(
                  fontSize: 32, fontWeight: FontWeight.bold),
            ),
            height30,
            const Text(
              'A minimalistic expense tracker app to track all your income & expenses without any hussle',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17),
            ),
            height50,
            CustomButton(
              title: "Get Started",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

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
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.teal.shade400, borderRadius: BorderRadius.circular(40)),
      child: Center(
          child: Text(
        title,
        style: GoogleFonts.lato(
            fontSize: 25, fontWeight: FontWeight.w700, color: Colors.white),
      )),
    );
  }
}
