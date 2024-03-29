import 'dart:io';
import 'package:expense_tracker/models/transaction_model/transaction_model.dart';
import 'package:expense_tracker/view/authentication/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'models/auth_model/auth_model.dart';
// import 'package:timezone/timezone.dart' as tz;
// import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Perform initialization tasks asynchronously
  await _initializeApp();

  runApp(const MyApp());
}

Future<void> _initializeApp() async {
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.initFlutter();
  Hive.registerAdapter<AuthModel>(AuthModelAdapter());
  Hive.registerAdapter<Transaction>(TransactionAdapter());
  Hive.registerAdapter<PaymentMode>(PaymentModeAdapter());
  Hive.registerAdapter<TransactionType>(TransactionTypeAdapter());
  await Hive.openBox<AuthModel>('AuthBox');
  await Hive.openBox<Transaction>('transactionBox');
  await Hive.openBox<String>('incomeCategoryBox');
  await Hive.openBox<String>('expenseCategoryBox');
  // NotificationServices().initializeNotifications();
  // tz.initializeTimeZones();
  // Set the default timezone to India
  // tz.setLocalLocation(tz.getLocation('Asia/Kolkata'));
  // TimePicker().loadSwitchState();
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // @override
  // void initState() {
  //   NotificationServices().initializeNotifications();
  //   listenNotifications();
  //   super.initState();
  // }

  // listenNotifications() {
  //   NotificationServices.onNotification.stream.listen((event) {});
  // }

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense tracker',
      home: ScreenSplash(),
    );
  }
}
