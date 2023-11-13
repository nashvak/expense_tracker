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

  //  S O R T  T H E  L I S T   A C C O R D I N G   T O   D A T E
  List<Transaction> get sortedList {
    List<Transaction> boxList = transactionBox.values.toList();
    boxList.sort((a, b) => b.date.compareTo(a.date));

    return boxList;
  }

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
}
