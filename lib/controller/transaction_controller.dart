import 'package:expense_tracker/models/transaction_model/transaction_model.dart';
import 'package:hive/hive.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  final Box transactionBox = Hive.box<Transaction>('transactionBox');
  //var transactionList = <Transaction>[].obs;
  // transactionList=_transactionBox.values.toList();
  // List<Transaction> get transactions => _transactionBox.values.toList();
  //Box get transactionBox => _transactionBox;
  int get transactionCount => transactionBox.length;
  createTransaction({required Transaction transaction}) async {
    await transactionBox.add(transaction);
    update();
  }

  updateTransaction({required int index, required Transaction transaction}) {
    transactionBox.putAt(index, transaction);
    update();
  }

  deleteTransaction({required int index}) {
    transactionBox.deleteAt(index);
    update();
  }
}
