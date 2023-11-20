import 'dart:developer';

import 'package:expense_tracker/controller/filer_controller.dart';
import 'package:expense_tracker/models/transaction_model/transaction_model.dart';
import 'package:expense_tracker/view/transaction/snackbars/snackbar.dart';

import 'package:hive/hive.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class TransactionController extends GetxController {
  DateRangePickerController dateRangePickerController =
      DateRangePickerController();
  final transactionBox = Hive.box<Transaction>('transactionBox');

  @override
  void onInit() {
    // Load transactions when the controller is initialized

    super.onInit();
  }

  //  S O R T  T H E  L I S T   A C C O R D I N G   T O   D A T E
  List<Transaction> get sortedList {
    List<Transaction> boxList = transactionBox.values.toList();
    boxList.sort((a, b) => b.date.compareTo(a.date));
    return boxList;
  }

  int get transactionCount => sortedList.length;

  //// F U N C T I O N   T O   A D D   T R A N S A C T I O N
  createTransaction(
      {required String key, required Transaction transaction, context}) async {
    log(key);
    await transactionBox
        .put(key, transaction)
        .then((value) => ToastUtil.showToast('Transaction added succesfully'));
    update();
  }

  deleteTransaction(id) async {
    FilterController filterController = FilterController();
    await filterController.deleteDialog(id);
  }
}
