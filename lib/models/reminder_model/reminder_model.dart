import 'package:expense_tracker/models/transaction_model/transaction_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 5)
class Remainder extends HiveObject {
  @HiveField(0)
  String description;

  @HiveField(1)
  int amount;

  @HiveField(2)
  DateTime date;
  @HiveField(3)
  DateTime time;

  @HiveField(4)
  final CatagoryType type;

  Remainder({
    required this.description,
    required this.amount,
    required this.date,
    required this.time,
    required this.type,
  });
}
