import 'package:hive/hive.dart';
part 'transaction_model.g.dart';

@HiveType(typeId: 2)
enum PaymentMode {
  @HiveField(0)
  cash,
  @HiveField(1)
  bank,
  @HiveField(2)
  card,
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
  String id;

  @HiveField(1)
  String description;
  @HiveField(2)
  final String catagoryType;
  @HiveField(3)
  double amount;

  @HiveField(4)
  DateTime date;

  @HiveField(5)
  final PaymentMode paymentMode;

  @HiveField(6)
  final TransactionType transactionType;

  Transaction(
      {required this.id,
      required this.description,
      required this.catagoryType,
      required this.amount,
      required this.date,
      required this.paymentMode,
      required this.transactionType});
}
