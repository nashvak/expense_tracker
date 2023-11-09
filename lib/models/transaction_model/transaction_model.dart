import 'package:hive/hive.dart';
part 'transaction_model.g.dart';

@HiveType(typeId: 2)
enum PaymentMode {
  @HiveField(0)
  cash,
  @HiveField(1)
  bank,
}

@HiveType(typeId: 3)
enum TransactionType {
  @HiveField(0)
  income,
  @HiveField(1)
  expense,
  @HiveField(2)
  transfer,
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
  final String catagoryType;

  @HiveField(4)
  final PaymentMode paymentMode;

  @HiveField(5)
  final TransactionType transactionType;

  Transaction(
      {required this.description,
      required this.amount,
      required this.date,
      required this.paymentMode,
      required this.catagoryType,
      required this.transactionType});
}
