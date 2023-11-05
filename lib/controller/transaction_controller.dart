import 'package:expense_tracker/models/transaction_model/transaction_model.dart';
import 'package:hive/hive.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  final transactionBox = Hive.box<Transaction>('transactionBox');

  //sort according to date
  List<Transaction> get sortedList {
    List<Transaction> boxList = transactionBox.values.toList();
    boxList.sort((a, b) => b.date.compareTo(a.date));

    return boxList;
  }

//  C A T E G O R Y   F I L T E R I N G

  Set<CatagoryType?> currentCatagory = {};

  List<CatagoryType?> isCatagoryIncluded() {
    Set<CatagoryType?> currentCatagory = {};
    for (var transaction in sortedList) {
      currentCatagory.add(transaction.catagoryType);
      currentCatagory.removeWhere((value) => value == null);
    }

    return currentCatagory.toList();
  }

  //

  //   E N A B L E     O R    D I S A B L E   A   L I S T  T I L E
  List<bool> isCatogoryVisible = List.generate(7, (index) => true);

  catogoryVisible(CatagoryType type) {}

  // F I L T E R I N G
  var selectedOption = 'All';
  changeOption(String value) {
    selectedOption = value;
    update();
  }

  List<Transaction> get sortByFunction {
    if (selectedOption == 'Income') {
      return sortedList
          .where((transaction) =>
              transaction.transactionType == TransactionType.income)
          .toList();
    } else if (selectedOption == 'Expense') {
      return sortedList
          .where((transaction) =>
              transaction.transactionType == TransactionType.expense)
          .toList();
    } else if (selectedOption == 'Cash') {
      return sortedList
          .where((transaction) => transaction.paymentMode == PaymentMode.cash)
          .toList();
    } else if (selectedOption == 'Bank') {
      return sortedList
          .where((transaction) => transaction.paymentMode == PaymentMode.bank)
          .toList();
    } else if (selectedOption == 'Food') {
      return sortedList
          .where((transaction) => transaction.catagoryType == CatagoryType.food)
          .toList();
    } else if (selectedOption == 'Bills') {
      return sortedList
          .where(
              (transaction) => transaction.catagoryType == CatagoryType.bills)
          .toList();
    } else if (selectedOption == 'Entertainment') {
      return sortedList
          .where((transaction) =>
              transaction.catagoryType == CatagoryType.entertainment)
          .toList();
    } else if (selectedOption == 'Insurance') {
      return sortedList
          .where((transaction) =>
              transaction.catagoryType == CatagoryType.insurance)
          .toList();
    } else if (selectedOption == 'Shopping') {
      return sortedList
          .where((transaction) =>
              transaction.catagoryType == CatagoryType.shopping)
          .toList();
    } else if (selectedOption == 'Others') {
      return sortedList
          .where(
              (transaction) => transaction.catagoryType == CatagoryType.others)
          .toList();
    } else if (selectedOption == 'Transportation') {
      return sortedList
          .where((transaction) =>
              transaction.catagoryType == CatagoryType.transportation)
          .toList();
    }

    return sortedList;
  }

// F U N C T I O N   T O   D I S P L A Y   T H E   T O T A L   I N C O M E
  double get totalIncome {
    return sortedList
        .where((transaction) =>
            transaction.transactionType == TransactionType.income)
        .fold(0.0, (sum, item) => sum + item.amount);
  }

// F U N C T I O N   T O   D I S P L A Y   T H E   T O T A L   E X P E N S E
  double get totalExpense {
    return sortedList
        .where((transaction) =>
            transaction.transactionType == TransactionType.expense)
        .fold(0.0, (sum, item) => sum + item.amount);
  }

  double get totalBalance => totalIncome - totalExpense;

  int get transactionCount => sortedList.length;
  //// F U N C T I O N   T O   A D D   T R A N S A C T I O N
  createTransaction({required Transaction transaction}) async {
    await transactionBox.add(transaction);
    update();
  }

// F U N C T I O N   T O   U P D A T E   T R A N S A C T I O N
  updateTransaction(
      {required int index, required Transaction transaction}) async {
    await transactionBox.putAt(index, transaction);

    update();
  }

// F U N C T I O N   T O   D E L E T E   T R A N S A C T I O N
  deleteTransaction({required int index}) {
    transactionBox.deleteAt(index);
    update();
  }

// F U N C T I O N   T O   L O G O U T
  logoutProfile() {
    transactionBox.clear();
    sortedList.clear();
  }
}
