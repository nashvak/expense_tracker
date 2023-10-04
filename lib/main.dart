import 'package:expense_tracker/view/authentication/get_started.dart';
import 'package:expense_tracker/view/authentication/login.dart';
import 'package:expense_tracker/view/authentication/signup.dart';
import 'package:expense_tracker/view/transaction/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense tracker',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const GetStartedScreen()),
        GetPage(name: '/login', page: () => const LoginScreen()),
        GetPage(name: '/signup', page: () => const ScreenSignup()),
        GetPage(name: '/home', page: () => const ScreenHome()),
      ],
    );
  }
}
