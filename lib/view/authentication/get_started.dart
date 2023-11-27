import 'package:expense_tracker/constatnts/custom_widgets/common/sizedbox.dart';
import 'package:expense_tracker/view/authentication/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constatnts/custom_widgets/common/button.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: screenWidth * 0.10,
          right: screenWidth * 0.10,
          top: screenHeight * .07,
          // bottom: screenHeight * 0.05,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlankSpace(
                height: screenHeight * 0.2,
              ),
              Image.asset(
                'images/budget.png',
                width: 150,
                height: 150,
              ),
              BlankSpace(
                height: screenHeight * 0.05,
              ),
              Text(
                "Welcome",
                style: GoogleFonts.gabriela(
                    fontSize: 32, fontWeight: FontWeight.bold),
              ),
              BlankSpace(
                height: screenHeight * 0.01,
              ),
              const Text(
                'A minimalistic expense tracker app to track all your income & expenses without any hussle',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17),
              ),
              BlankSpace(
                height: screenHeight * 0.1,
              ),
              SignupButton(
                title: "Get Started",
                onTap: () {
                  Get.off(
                    () => const ScreenSignup(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
