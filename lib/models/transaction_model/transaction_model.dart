import 'dart:core';

import 'package:hive/hive.dart';
part 'transaction_model.g.dart';

@HiveType(typeId: 2)
enum CatagoryType {
  @HiveField(0)
  income,
  @HiveField(1)
  expense,
}

@HiveType(typeId: 3)
enum PaymentMode {
  @HiveField(0)
  cash,
  @HiveField(1)
  bank,
}

@HiveType(typeId: 1)
class Transaction extends HiveObject {
  @HiveField(0)
  String description;

  @HiveField(1)
  int amount;

  @HiveField(2)
  DateTime date;

  @HiveField(3)
  final CatagoryType type;

  @HiveField(4)
  final PaymentMode mode;

  Transaction({
    required this.description,
    required this.amount,
    required this.date,
    required this.mode,
    required this.type,
  });
}
