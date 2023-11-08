import 'dart:async';

import 'package:expense_tracker/view/authentication/get_started.dart';
import 'package:expense_tracker/view/transaction/bottom_nav.dart';

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
              MaterialPageRoute(builder: (ctx) => const BottomNav()),
              (route) => false);
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const GetStartedScreen()));
        }
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const GetStartedScreen()));
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
