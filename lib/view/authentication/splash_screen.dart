import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    getstarted();
    super.initState();
  }

  void getstarted() {
    Timer.periodic(Duration(seconds: 3), (timer) {
      Get.toNamed('/getstarted');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/expense-logo.png',
              width: 200,
              height: 200,
              fit: BoxFit.fitHeight,
            ),
            Text(
              'Expenso',
              style: GoogleFonts.lato(fontSize: 25),
            )
          ],
        ),
      ),
    );
  }
}
