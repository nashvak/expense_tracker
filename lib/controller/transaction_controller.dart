import 'package:expense_tracker/models/transaction_model/transaction_model.dart';

import 'package:hive/hive.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  final Box<Transaction> _transactionBox =
      Hive.box<Transaction>('transactionBox');
  List<Transaction> get transactions => _transactionBox.values.toList();
  //Box get transactionBox => _transactionBox;
  int get transactionCount => _transactionBox.length;
  createTransaction({required Transaction transaction}) async {
    await _transactionBox.add(transaction);
    update();
  }

  updateTransaction({required int index, required Transaction transaction}) {
    _transactionBox.putAt(index, transaction);
    update();
  }

  deleteTransaction({required int index}) {
    _transactionBox.deleteAt(index);
    update();
  }
}
