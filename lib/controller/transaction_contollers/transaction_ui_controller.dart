import 'package:expense_tracker/models/transaction_model/transaction_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class UiController extends GetxController {
  PaymentMode? selectedPaymentMode;
  TransactionType selectedTransactionType = TransactionType.income;
  String? selectedCategory;
  var selectedDate = DateTime.now();
  bool? isDropdownIncome = true;
  List<String> incomeCatagoryTypes = ['Salary', 'Allowance', 'Bonus'];

  List<String> expenseCatagoryTypes = ['Food', 'Entertainment', 'Loan'];

  List<String> transferCatagoryTypes = ['bank charges', 'profit', 'lend'];
  late List<String> categoryItem;

//   A D D   C A T E G O R Y   F U N C T I O N

  addCategory(value) {
    if (selectedTransactionType == TransactionType.income) {
      incomeCatagoryTypes.add(value);
    } else if (selectedTransactionType == TransactionType.expense) {
      expenseCatagoryTypes.add(value);
    }
    update();
  }

//  S H O W I N G   T H E   C A T E G O R Y   I F   I N C O M E   O R    E X P E N S E
  List<String> showCategoryDropdown() {
    if (isDropdownIncome == true) {
      categoryItem = incomeCatagoryTypes;
    } else if (isDropdownIncome == false) {
      categoryItem = expenseCatagoryTypes;
    } else {
      categoryItem = transferCatagoryTypes;
    }
    return categoryItem;
  }

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

  changeToggle(index) async {
    selectedTransactionType = (index == 0)
        ? TransactionType.income
        : index == 1
            ? TransactionType.expense
            : TransactionType.transfer;
    // print(selectedTransactionType);
    //isDropdownVisible = index == 1;
    if (selectedTransactionType == TransactionType.income) {
      isDropdownIncome = true;
    } else if (selectedTransactionType == TransactionType.expense) {
      isDropdownIncome = false;
    } else {
      isDropdownIncome = null;
    }
    selectedCategory = null;

    update();
  }

  resetValues() {
    // selectedTransactionType = TransactionType.income;
    selectedCategory = null;
    selectedDate = DateTime.now();
    selectedPaymentMode = null;
    selectedDate = DateTime.now();
    update();
  }
}
