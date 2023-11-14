import 'package:expense_tracker/models/transaction_model/transaction_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hive/hive.dart';

class UiController extends GetxController {
  PaymentMode? selectedPaymentMode;
  TransactionType selectedTransactionType = TransactionType.income;
  String? selectedCategory;

  bool? isTransactionIncome = true;

  @override
  void onInit() {
    initCategoryBox();
    super.onInit();
  }

//   A D D   C A T E G O R Y   F U N C T I O N

  Box<String> incomeCategorybox = Hive.box('incomeCategoryBox');
  Box<String> expenseCategorybox = Hive.box('expenseCategoryBox');
  void initCategoryBox() async {
    if (incomeCategorybox.isEmpty) {
      await incomeCategorybox.addAll(['Salary', 'Allowance', 'Bonus']);
    }
    if (expenseCategorybox.isEmpty) {
      await expenseCategorybox
          .addAll(['Food', 'Entertainment', 'Loan', 'Shopping']);
    }
  }

//  S H O W I N G   T H E   C A T E G O R Y   I F   I N C O M E   O R    E X P E N S E
  showCategoryDropdown() {
    if (selectedTransactionType == TransactionType.income) {
      return incomeCategorybox.values.toList();
    } else {
      return expenseCategorybox.values.toList();
    }
  }

  //  A D D   A    C A T E G O R Y    T O   B O X
  addCategory(value) {
    if (selectedTransactionType == TransactionType.income) {
      incomeCategorybox.add(value);
    } else if (selectedTransactionType == TransactionType.expense) {
      expenseCategorybox.add(value);
    }
    update();
  }

//  U P D A T E   C A T E G O R Y
  updateCategory(index, newValue) {
    if (selectedTransactionType == TransactionType.income) {
      incomeCategorybox.putAt(index, newValue);
    } else {
      expenseCategorybox.putAt(index, newValue);
    }
    update();
  }

//   D E L E T E    C A T E G O R Y
  deleteCategory(index) {
    if (selectedTransactionType == TransactionType.income) {
      incomeCategorybox.deleteAt(index);
    } else {
      expenseCategorybox.deleteAt(index);
    }
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
    selectedTransactionType =
        (index == 0) ? TransactionType.income : TransactionType.expense;
    // print(selectedTransactionType);
    //isDropdownVisible = index == 1;
    // if (selectedTransactionType == TransactionType.income) {
    //   isTransactionIncome = true;
    // } else {
    //   isTransactionIncome = false;
    // }
    selectedCategory = null; //reset the value

    update();
  }

  resetValues() {
    selectedCategory = null;
    // c.selectedDate = DateTime.now();
    selectedPaymentMode = null;

    update();
  }
}
