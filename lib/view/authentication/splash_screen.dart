import 'dart:async';

import 'package:expense_tracker/view/authentication/get_started.dart';

import 'package:expense_tracker/view/transaction/home_screen.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => ScreenSplashState();
}

class ScreenSplashState extends State<ScreenSplash> {
  static const String keyToLogin = "";
  Timer? _timer;
  @override
  void initState() {
    checkScreen(context);
    super.initState();
  }

  // void navigation() {
  //   _timer = Timer(const Duration(seconds: 3), () {
  //     if (mounted) {
  //       // Check if the widget is still in the tree
  //       Get.offNamed('/getstarted');
  //     }
  //   });
  // }

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
              'Expensly',
              style: GoogleFonts.lato(fontSize: 25),
            )
          ],
        ),
      ),
    );
  }

  void checkScreen(BuildContext ctx) async {
    var pref = await SharedPreferences.getInstance();
    var isLoggedIn = pref.getBool(keyToLogin);

    Timer(const Duration(seconds: 1), () {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (ctx) => const ScreenHome()),
              (route) => false);
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => GetStartedScreen()));
        }
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => GetStartedScreen()));
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
