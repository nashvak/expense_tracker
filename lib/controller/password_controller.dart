import 'package:expense_tracker/models/transaction_model/transaction_model.dart';
import 'package:get/get.dart';

class PasswordController extends GetxController {
  RxBool visibility = true.obs;
  void changeVisibility(bool value) {
    visibility.value = !visibility.value;
  }
}

///date picker

class UiController extends GetxController {
  PaymentMode? selectedPaymentMode;
  TransactionType selectedTransactionType = TransactionType.income;
  CatagoryType? selectedCategory;
  var selectedDate = DateTime.now();

  updateDate(DateTime newDate) {
    selectedDate = newDate;
    update();
  }

  changePaymentMode(PaymentMode newValue) {
    selectedPaymentMode = newValue;
    update();
  }

  changeCatagory(CatagoryType newValue) {
    selectedCategory = newValue;
    update();
  }

  changeToggle(index) {
    selectedTransactionType =
        (index == 0) ? TransactionType.income : TransactionType.expense;
    update();
  }

  // resetValues() {
  //   selectedTransactionType;
  // }
}

//

//

//
class UpdateController extends GetxController {
  late TransactionType transaction;
  late PaymentMode mode;
  late CatagoryType catagory;
  late DateTime date;
  updateDate(DateTime newDate) {
    date = newDate;
    update();
  }

  changePaymentMode(PaymentMode newValue) {
    mode = newValue;
    update();
  }

  changeTransactionType(newValue) {
    transaction = newValue;
    update();
  }

  changeCategoryType(newValue) {
    catagory = newValue;
    update();
  }
}
