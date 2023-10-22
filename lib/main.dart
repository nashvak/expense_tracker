import 'dart:io';

import 'package:expense_tracker/models/transaction_model/transaction_model.dart';
import 'package:expense_tracker/repository/auth_repository.dart';
import 'package:expense_tracker/view/authentication/get_started.dart';
import 'package:expense_tracker/view/authentication/login.dart';
import 'package:expense_tracker/view/authentication/signup.dart';
import 'package:expense_tracker/view/authentication/splash_screen.dart';
import 'package:expense_tracker/view/remainder/add_remainder.dart';
import 'package:expense_tracker/view/remainder/edit_remainder.dart';
import 'package:expense_tracker/view/remainder/remainder_screen.dart';
import 'package:expense_tracker/view/transaction/add_transaction.dart';
import 'package:expense_tracker/view/transaction/bottom_nav.dart';
import 'package:expense_tracker/view/transaction/home_screen.dart';
import 'package:expense_tracker/view/transaction/view_transaction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'models/auth_model/auth_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.initFlutter();
  Hive.registerAdapter<AuthModel>(AuthModelAdapter());
  Hive.registerAdapter<Transaction>(TransactionAdapter());
  Hive.registerAdapter<PaymentMode>(PaymentModeAdapter());
  Hive.registerAdapter<CatagoryType>(CatagoryTypeAdapter());
  await AuthRepository.openBox();
  await Hive.openBox<Transaction>('transactionBox');
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
        GetPage(name: '/signup', page: () => const ScreenSignup()),
        GetPage(name: '/home', page: () => const ScreenHome()),
        GetPage(name: '/bottom', page: () => const BottomNav()),
        GetPage(name: '/viewtransaction', page: () => ScreenViewTransaction()),
        GetPage(
            name: '/addtransaction', page: () => const ScreenAddTransaction()),
        GetPage(name: '/addremainder', page: () => ScreenAddRemainder()),
        GetPage(name: '/remainder', page: () => ScreenRemainder()),
        GetPage(name: '/editremainder', page: () => ScreenEditRemainder()),
      ],
    );
  }
}
