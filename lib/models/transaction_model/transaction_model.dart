import 'dart:core';
import 'package:hive/hive.dart';
part 'transaction_model.g.dart';

@HiveType(typeId: 2)
enum CatagoryType {
  @HiveField(0)
  bills,
  @HiveField(1)
  food,
  @HiveField(2)
  entertainment,
  @HiveField(3)
  transportation,
  @HiveField(4)
  shopping,
  @HiveField(5)
  insurance,
  @HiveField(6)
  others,
}

@HiveType(typeId: 3)
enum PaymentMode {
  @HiveField(0)
  cash,
  @HiveField(1)
  bank,
}

@HiveType(typeId: 4)
enum TransactionType {
  @HiveField(0)
  income,
  @HiveField(1)
  expense,
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
  final CatagoryType? catagoryType;

  @HiveField(4)
  final PaymentMode paymentMode;

  @HiveField(5)
  final TransactionType transactionType;

  Transaction(
      {required this.description,
      required this.amount,
      required this.date,
      required this.paymentMode,
      this.catagoryType,
      required this.transactionType});
}
