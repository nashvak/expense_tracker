import 'package:expense_tracker/models/transaction_model/transaction_model.dart';
import 'package:hive/hive.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  final transactionBox = Hive.box<Transaction>('transactionBox');
  List<Transaction> incomeBox = [];
  List<Transaction> expenseBox = [];

  //sort according to date
  List<Transaction> get sortedList {
    List<Transaction> boxList = transactionBox.values.toList();
    boxList.sort((a, b) => b.date.compareTo(a.date));

    return boxList;
  }
//

//
  double get totalIncome {
    return sortedList
        .where((transaction) => transaction.type == CatagoryType.income)
        .fold(0.0, (sum, item) => sum + item.amount);
  }

  double get totalExpense {
    return sortedList
        .where((transaction) => transaction.type == CatagoryType.expense)
        .fold(0.0, (sum, item) => sum + item.amount);
  }

  double get totalBalance => totalIncome - totalExpense;

  int get transactionCount => sortedList.length;
  //create transaction
  createTransaction({required Transaction transaction}) async {
    await transactionBox.add(transaction);
    update();
  }

  updateTransaction(
      {required int index, required Transaction transaction}) async {
    await transactionBox.putAt(index, transaction);

    update();
  }

  deleteTransaction({required int index}) {
    transactionBox.deleteAt(index);

    update();
  }

  logoutProfile() {
    transactionBox.clear();
    sortedList.clear();
  }
}
