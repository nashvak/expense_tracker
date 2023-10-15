import 'package:expense_tracker/models/auth_model/auth_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AuthRepository {
  static const String transactionBox = 'transactionsBox';
  static openBox() async => await Hive.openBox<AuthModel>(transactionBox);
  static Box getBox() => Hive.box<AuthModel>(transactionBox);
  static closeBox() async => await Hive.box(transactionBox).close();
}
