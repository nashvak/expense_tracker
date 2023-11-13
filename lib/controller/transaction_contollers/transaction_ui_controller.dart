import 'package:expense_tracker/models/transaction_model/transaction_model.dart';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class UiController extends GetxController {
  // DatePickerController datePickerController = DatePickerController();
  PaymentMode? selectedPaymentMode;
  TransactionType selectedTransactionType = TransactionType.income;
  String? selectedCategory;

  bool? isTransactionIncome = true;
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

  editCategory() {
    return selectedTransactionType == TransactionType.income
        ? incomeCatagoryTypes
        : expenseCatagoryTypes;
  }

  updateCategory(index, newValue) {
    editCategory()[index] = newValue;
    update();
  }

  deleteCategory(index) {
    List<String> categoryList = editCategory();
    categoryList.removeAt(index);
    update();
  }

  //  S H O W I N G   T H E   C A T E G O R Y   I F   I N C O M E   O R    E X P E N S E
  List<String> showCategoryDropdown() {
    if (isTransactionIncome == true) {
      categoryItem = incomeCatagoryTypes;
    } else if (isTransactionIncome == false) {
      categoryItem = expenseCatagoryTypes;
    } else {
      categoryItem = transferCatagoryTypes;
    }
    return categoryItem;
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
    selectedTransactionType =
        (index == 0) ? TransactionType.income : TransactionType.expense;
    // print(selectedTransactionType);
    //isDropdownVisible = index == 1;
    if (selectedTransactionType == TransactionType.income) {
      isTransactionIncome = true;
    } else {
      isTransactionIncome = false;
    }
    selectedCategory = null;

    update();
  }

  resetValues() {
    selectedCategory = null;
    // c.selectedDate = DateTime.now();
    selectedPaymentMode = null;

    update();
  }
}
