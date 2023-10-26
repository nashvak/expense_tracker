import 'package:expense_tracker/models/transaction_model/transaction_model.dart';
import 'package:hive/hive.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  final transactionBox = Hive.box<Transaction>('transactionBox');
  List<Transaction> incomeBox = [];
  List<Transaction> expenseBox = [];
  List<Transaction> get sortedList {
    List<Transaction> boxList = transactionBox.values.toList();
    boxList.sort((a, b) => b.date.compareTo(a.date));
    return boxList;
  }
//

//

  int get transactionCount => sortedList.length;
  //create transaction
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
