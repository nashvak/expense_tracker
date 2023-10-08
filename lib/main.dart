import 'package:expense_tracker/view/authentication/get_started.dart';
import 'package:expense_tracker/view/authentication/login.dart';
import 'package:expense_tracker/view/authentication/signup.dart';
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
        GetPage(name: '/', page: () => const GetStartedScreen()),
        GetPage(name: '/login', page: () => const LoginScreen()),
        GetPage(name: '/signup', page: () => const ScreenSignup()),
        GetPage(name: '/home', page: () => const ScreenHome()),
        GetPage(name: '/bottom', page: () => const BottomNav()),
        GetPage(
            name: '/viewtransaction',
            page: () => const ScreenViewTransaction()),
        GetPage(
            name: '/addtransaction', page: () => const ScreenAddTransaction()),
        GetPage(name: '/addremainder', page: () => const ScreenAddRemainder()),
        GetPage(name: '/remainder', page: () => ScreenRemainder()),
        GetPage(
            name: '/editremainder', page: () => const ScreenEditRemainder()),
      ],
    );
  }
}
