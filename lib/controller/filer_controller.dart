// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:developer';

import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/controller/transaction_contollers/transaction_controller.dart';

import 'package:expense_tracker/models/transaction_model/transaction_model.dart';
import 'package:expense_tracker/view/transaction/snackbars/snackbar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterController extends GetxController {
  TransactionController transactionController = TransactionController();

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  //  C A T E G O R Y   I S    D I S P L A Y I N G    I N    T H E   B O T T O M   S H E E T
  List<String> catagoryTitles = [];
  List<String> isCatagoryIncluded() {
    Set<String> currentCatagory = {};

    for (var transaction in transactionController.sortedList) {
      currentCatagory.add(transaction.catagoryType);
      // currentCatagory.removeWhere((value) => value == null);
      // print(currentCatagory);
      catagoryTitles = currentCatagory
          // .map((category) => category.toString().split('.').last)
          .toList();
    }
    // print(catagoryTitles);
    return catagoryTitles;
  }

  //  F I L T E R   B Y   I T E M S    I S    D I S P L A Y I N G    I N    T H E   B O T T O M   S H E E T

  List<String> isFilterIncluded() {
    List<String> filterTitles = ['All'];
    List<String> uniqueTitles = [];
    for (var transaction in transactionController.sortedList) {
      filterTitles.add(transaction.transactionType.toString().split('.').last);
      filterTitles.add(transaction.paymentMode.toString().split('.').last);
      uniqueTitles = filterTitles.toSet().toList();
      // print(uniqueTitles);
    }
    // print(catagoryTitles);
    return uniqueTitles;
  }

  String? k;
  // F I L T E R I N G
  var selectedOption = 'All';
  changeOption(String value) {
    selectedOption = value;

    List<String> nn = catagoryTitles
        .where((element) => element.contains(selectedOption))
        .toList();
    k = nn.join('');

    update();
  }

  List<Transaction> get sortByFunction {
    if (selectedOption == 'income') {
      return transactionController.sortedList
          .where((transaction) =>
              transaction.transactionType == TransactionType.income)
          .toList();
    } else if (selectedOption == 'expense') {
      return transactionController.sortedList
          .where((transaction) =>
              transaction.transactionType == TransactionType.expense)
          .toList();
    } else if (selectedOption == 'cash') {
      return transactionController.sortedList
          .where((transaction) => transaction.paymentMode == PaymentMode.cash)
          .toList();
    } else if (selectedOption == 'bank') {
      return transactionController.sortedList
          .where((transaction) => transaction.paymentMode == PaymentMode.bank)
          .toList();
    } else if (selectedOption == 'card') {
      return transactionController.sortedList
          .where((transaction) => transaction.paymentMode == PaymentMode.card)
          .toList();
    } else if (selectedOption == 'Date') {
      // print(endDate);

      List<Transaction> datefilter = transactionController.sortedList
          .where((transaction) => (transaction.date
                  .isAfter(startDate.subtract(const Duration(days: 1))) &&
              transaction.date.isBefore(endDate.add(const Duration(days: 1)))))
          .toList();
      datefilter.sort((a, b) => b.date.compareTo(a.date));
      return datefilter;
    } else if (selectedOption == k.toString()) {
      int index = catagoryTitles.indexOf(selectedOption);
      return transactionController.sortedList
          .where((transaction) =>
              transaction.catagoryType == catagoryTitles[index])
          .toList();
    }

    return transactionController.sortedList;
  }

  //   D A T E   R A N G E    P I C K E R

  void selectDateRange() async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: Get.context!,
      initialDateRange: DateTimeRange(
        start: startDate,
        end: endDate,
      ),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    );

    try {
      if (picked != null) {
        startDate = picked.start;
        endDate = picked.end;

        await changeOption(
            'Date'); // if date is picked,then only this function should work
      }
    } catch (e) {
      ToastUtil.showToast('Something went wrong');
    }
  }

// F U N C T I O N   T O   D E L E T E   T R A N S A C T I O N
  deleteTransaction({required String id}) {
    Transaction transaction =
        transactionController.transactionBox.values.firstWhere(
      (transaction) => transaction.id == id,
    );
    transaction.delete().then(
        (value) => ToastUtil.showToast('Transaction deleted succesfully'));
    update();
  }

  deleteDialog(String id) {
    Get.defaultDialog(
      title: 'Delete record',
      middleText: 'Do you want to delete this record',
      backgroundColor: Appcolor.white,
      radius: 20,
      contentPadding: const EdgeInsets.all(10),
      titlePadding: const EdgeInsets.all(20),
      textCancel: 'Cancel',
      textConfirm: 'Ok',
      cancelTextColor: Appcolor.primaryColor,
      onCancel: () {
        Get.back();
      },
      confirmTextColor: Appcolor.primaryColor,
      onConfirm: () async {
        await deleteTransaction(id: id);
        Get.back();
        Get.back();
      },
      buttonColor: Colors.transparent,
    );
  }

  // F U N C T I O N   T O   U P D A T E   T R A N S A C T I O N
  updateTransaction(
      {required String id, required Transaction transaction, context}) async {
    try {
      // log("blad ${transactionController.transactionBox.keys.toList()}");
      // log("update id $id");

      if (transactionController.transactionBox.keys.contains(id)) {
        log(transactionController.transactionBox.get(id).toString());
        await transactionController.transactionBox.put(id, transaction);
        ToastUtil.showToast('Transaction edited successfully');
        update();
      }
    } catch (e) {
      ToastUtil.showToast('Error in updating');
    }
  }
}
