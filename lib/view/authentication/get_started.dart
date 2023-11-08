import 'package:expense_tracker/view/authentication/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constatnts/custom_widgets/common/button.dart';
import '../../constatnts/custom_widgets/common/sizedbox.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 25, right: 25, top: 100, bottom: 70),
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
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: CustomButton(
                  title: "Get Started",
                  onTap: () {
                    Get.off(() => const ScreenSignup());
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
