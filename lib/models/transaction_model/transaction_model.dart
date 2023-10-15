import 'dart:core';

import 'package:hive/hive.dart';
//part 'transaction_model.g.dart';

@HiveType(typeId: 1)
class AuthModel extends HiveObject {
  @HiveField(0)
  String description;

  @HiveField(1)
  int amount;

  @HiveField(2)
  DateTime date;

  @HiveField(3)
  String isExpenseOrIncome;

  @HiveField(4)
  String paymentMode;
  AuthModel(
      {required this.description,
      required this.amount,
      required this.date,
      required this.isExpenseOrIncome,
      required this.paymentMode});
}
