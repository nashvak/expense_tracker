import 'package:expense_tracker/models/transaction_model/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class UiController extends GetxController {
  PaymentMode? selectedPaymentMode;
  TransactionType selectedTransactionType = TransactionType.income;
  String? selectedCategory;
  var selectedDate = DateTime.now();
  bool isDropdownVisible = false;
  List<String> catagoryTypes = ['Food', 'Entertainment', 'Loan'];
//  F U N C T I O N    T O   P I C K    D A TE
  getDate(context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2023),
        lastDate: DateTime(2024));
    await updateDate(pickedDate!);
    return selectedDate;
  }

  updateDate(DateTime newDate) {
    selectedDate = newDate;
    update();
  }

//
  changePaymentMode(PaymentMode newValue) {
    selectedPaymentMode = newValue;
    update();
  }

  changeCatagory(String newValue) {
    selectedCategory = newValue;
    update();
  }

  changeToggle(index) {
    selectedTransactionType =
        (index == 0) ? TransactionType.income : TransactionType.expense;
    isDropdownVisible = index == 1;
    update();
  }

  resetValues() {
    // selectedTransactionType = TransactionType.income;
    selectedCategory = null;
    selectedDate = DateTime.now();
    selectedPaymentMode = null;
    update();
  }
}
