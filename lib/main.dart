import 'dart:io';

import 'package:expense_tracker/models/reminder_model/reminder_model.dart';
import 'package:expense_tracker/models/transaction_model/transaction_model.dart';

import 'package:expense_tracker/view/authentication/splash_screen.dart';
import 'package:expense_tracker/view/profile/notification/notification_settings.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'models/auth_model/auth_model.dart';
// import 'package:timezone/timezone.dart' as tz;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.initFlutter();
  Hive.registerAdapter<AuthModel>(AuthModelAdapter());
  Hive.registerAdapter<Transaction>(TransactionAdapter());
  Hive.registerAdapter<PaymentMode>(PaymentModeAdapter());
  Hive.registerAdapter<TransactionType>(TransactionTypeAdapter());
  Hive.registerAdapter<CatagoryType>(CatagoryTypeAdapter());
  Hive.registerAdapter<Remainder>(RemainderAdapter());
  await Hive.openBox<AuthModel>('AuthBox');
  await Hive.openBox<Transaction>('transactionBox');
  await Hive.openBox<Remainder>('remainderBox');
  NotificationServices().initializeNotifications();
  // tz.initializeTimeZones();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense tracker',
      home: ScreenSplash(),
    );
  }
}
