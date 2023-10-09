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
  Timer? _timer;
  @override
  void initState() {
    navigation();
    super.initState();
  }

  void navigation() {
    _timer = Timer(const Duration(seconds: 2), () {
      if (mounted) {
        // Check if the widget is still in the tree
        Get.offNamed('/getstarted');
      }
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

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer if it's still active
    super.dispose();
  }
}
