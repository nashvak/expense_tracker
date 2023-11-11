import 'dart:io';

import 'package:expense_tracker/models/transaction_model/transaction_model.dart';

import 'package:expense_tracker/view/authentication/splash_screen.dart';
import 'package:expense_tracker/view/profile/notification/notification_settings.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'models/auth_model/auth_model.dart';
// import 'package:timezone/timezone.dart' as tz;

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.initFlutter();
  Hive.registerAdapter<AuthModel>(AuthModelAdapter());
  Hive.registerAdapter<Transaction>(TransactionAdapter());
  Hive.registerAdapter<PaymentMode>(PaymentModeAdapter());
  Hive.registerAdapter<TransactionType>(TransactionTypeAdapter());

  await Hive.openBox<AuthModel>('AuthBox');
  await Hive.openBox<Transaction>('transactionBox');

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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense tracker',
      scaffoldMessengerKey: snackbarKey,
      home: const ScreenSplash(),
    );
  }
}
