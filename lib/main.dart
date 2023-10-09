import 'package:expense_tracker/view/authentication/get_started.dart';
import 'package:expense_tracker/view/authentication/login.dart';
import 'package:expense_tracker/view/authentication/signup.dart';
import 'package:expense_tracker/view/authentication/splash_screen.dart';
import 'package:expense_tracker/view/remainder/add_remainder.dart';
import 'package:expense_tracker/view/remainder/edit_remainder.dart';
import 'package:expense_tracker/view/remainder/remainder_screen.dart';
import 'package:expense_tracker/view/transaction/add_transaction.dart';
import 'package:expense_tracker/view/transaction/dashboard/bottom_nav.dart';
import 'package:expense_tracker/view/transaction/home_screen.dart';
import 'package:expense_tracker/view/transaction/view_transaction.dart';
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
        GetPage(name: '/', page: () => const ScreenSplash()),
        GetPage(name: '/getstarted', page: () => const GetStartedScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/signup', page: () => ScreenSignup()),
        GetPage(name: '/home', page: () => const ScreenHome()),
        GetPage(name: '/bottom', page: () => const BottomNav()),
        GetPage(
            name: '/viewtransaction',
            page: () => const ScreenViewTransaction()),
        GetPage(name: '/addtransaction', page: () => ScreenAddTransaction()),
        GetPage(name: '/addremainder', page: () => ScreenAddRemainder()),
        GetPage(name: '/remainder', page: () => ScreenRemainder()),
        GetPage(name: '/editremainder', page: () => ScreenEditRemainder()),
      ],
    );
  }
}
