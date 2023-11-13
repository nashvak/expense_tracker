import 'package:expense_tracker/controller/transaction_contollers/transaction_controller.dart';
import 'package:expense_tracker/models/transaction_model/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterController extends GetxController {
  TransactionController transactionController = TransactionController();

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  //  C A T E G O R Y   I S    D I S P L A Y I N G    I N    T H E   B O T T O M   S H E E T

  List<String> isCatagoryIncluded() {
    Set<String> currentCatagory = {};
    List<String> catagoryTitles = [];
    for (var transaction in transactionController.sortedList) {
      currentCatagory.add(transaction.catagoryType);
      // currentCatagory.removeWhere((value) => value == null);
      print(currentCatagory);
      catagoryTitles = currentCatagory
          .map((category) => category.toString().split('.').last)
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
      print(uniqueTitles);
    }
    // print(catagoryTitles);
    return uniqueTitles;
  }

  // F I L T E R I N G
  var selectedOption = 'All';
  changeOption(String value) {
    selectedOption = value;
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
    }
    // else if (selectedOption == 'food') {
    //   return sortedList
    //       .where((transaction) => transaction.catagoryType == CatagoryType.food)
    //       .toList();
    // }
    else if (selectedOption == 'Date') {
      print(endDate);
      return transactionController.sortedList
          .where((transaction) =>
              (transaction.date.isAfter(startDate) &&
                  transaction.date.isBefore(endDate)) ||
              transaction.date.isAtSameMomentAs(endDate) ||
              transaction.date.isAtSameMomentAs(startDate))
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
        print('dsafs');
      }
    } catch (e) {
      print('Not picked');
    }
  }
}
