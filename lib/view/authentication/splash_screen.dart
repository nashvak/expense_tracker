import 'dart:async';
import 'package:expense_tracker/controller/authentication_section/splashscreen_contoller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => ScreenSplashState();
}

class ScreenSplashState extends State<ScreenSplash> {
  SplashScreenContoller splash = Get.put(SplashScreenContoller());

  Timer? _timer;
  @override
  void initState() {
    splash.checkScreen(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size.width;
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
              'Expensly',
              style: GoogleFonts.lato(fontSize: 25),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
