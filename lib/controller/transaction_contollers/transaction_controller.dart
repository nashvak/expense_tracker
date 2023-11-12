import 'package:expense_tracker/main.dart';
import 'package:expense_tracker/models/transaction_model/transaction_model.dart';
import 'package:expense_tracker/view/transaction/snackbars/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class TransactionController extends GetxController {
  DateRangePickerController dateRangePickerController =
      DateRangePickerController();

  final transactionBox = Hive.box<Transaction>('transactionBox');

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  //sort according to date
  List<Transaction> get sortedList {
    List<Transaction> boxList = transactionBox.values.toList();
    boxList.sort((a, b) => b.date.compareTo(a.date));

    return boxList;
  }

  //

  //   E N A B L E     O R    D I S A B L E   A   L I S T  T I L E

  // List<bool> isCatogoryVisible = List.generate(7, (index) => true);
//

  // List<String>  catagoryTitles = CatagoryType.values
  //     .map((category) => category.toString().split('.').last)
  //     .toList();

  //
  catogoryVisible(String type) {}

  // F I L T E R I N G
  var selectedOption = 'All';
  changeOption(String value) {
    selectedOption = value;
    update();
  }

  void get selectDateRange async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: Get.context!,
      initialDateRange: DateTimeRange(
        start: startDate,
        end: endDate,
      ),
      firstDate: DateTime(2023),
      lastDate: DateTime(2024),
    );

    try {
      if (picked != null) {
        startDate = picked.start;
        endDate = picked.end;
        await changeOption(
            'Date'); // if date is picked,then only this function should work
        startDate = DateTime.now(); //clear the picked date
        endDate = DateTime.now();
        update();
      }
    } catch (e) {
      print('Not picked');
    }
  }

  List<Transaction> get sortByFunction {
    print(startDate);
    print(endDate);
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
    }
    // else if (selectedOption == 'food') {
    //   return sortedList
    //       .where((transaction) => transaction.catagoryType == CatagoryType.food)
    //       .toList();
    // } else if (selectedOption == 'bills') {
    //   return sortedList
    //       .where(
    //           (transaction) => transaction.catagoryType == CatagoryType.bills)
    //       .toList();
    // } else if (selectedOption == 'entertainment') {
    //   return sortedList
    //       .where((transaction) =>
    //           transaction.catagoryType == CatagoryType.entertainment)
    //       .toList();
    // } else if (selectedOption == 'insurance') {
    //   return sortedList
    //       .where((transaction) =>
    //           transaction.catagoryType == CatagoryType.insurance)
    //       .toList();
    // } else if (selectedOption == 'shopping') {
    //   return sortedList
    //       .where((transaction) =>
    //           transaction.catagoryType == CatagoryType.shopping)
    //       .toList();
    // } else if (selectedOption == 'others') {
    //   return sortedList
    //       .where(
    //           (transaction) => transaction.catagoryType == CatagoryType.others)
    //       .toList();
    // } else if (selectedOption == 'transportation') {
    //   return sortedList
    //       .where((transaction) =>
    //           transaction.catagoryType == CatagoryType.transportation)
    //       .toList();
    // }
    else if (selectedOption == 'Date') {
      return sortedList
          .where((transaction) =>
              transaction.date.isAfter(startDate!) &&
                  transaction.date.isBefore(endDate!) ||
              transaction.date.isAtSameMomentAs(startDate!) ||
              transaction.date.isAtSameMomentAs(endDate!))
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
  createTransaction({required Transaction transaction, context}) async {
    await transactionBox.add(transaction).then(
        (value) => snackbarKey.currentState?.showSnackBar(successSnackbar));
    update();
  }

// F U N C T I O N   T O   U P D A T E   T R A N S A C T I O N
  updateTransaction(
      {required int index, required Transaction transaction, context}) async {
    await transactionBox
        .putAt(index, transaction)
        .then((value) => snackbarKey.currentState?.showSnackBar(editSnackbar));

    update();
  }

// F U N C T I O N   T O   D E L E T E   T R A N S A C T I O N
  deleteTransaction({required int index}) {
    transactionBox.deleteAt(index).then(
        (value) => snackbarKey.currentState?.showSnackBar(deleteSnackbar));
    //     ScaffoldMessenger.of(context).showSnackBar(deleteTransactionSnackbar));
    update();
  }

// F U N C T I O N   T O   L O G O U T
  logoutProfile() {
    transactionBox.clear();
    sortedList.clear();
  }
}
