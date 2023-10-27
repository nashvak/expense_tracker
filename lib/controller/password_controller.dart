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
  CatagoryType selectedCatagory = CatagoryType.income;
  var selectedDate = DateTime.now();

  updateDate(DateTime newDate) {
    selectedDate = newDate;
    update();
  }

  changePaymentMode(PaymentMode newValue) {
    selectedPaymentMode = newValue;
    update();
  }

  changeToggle(index) {
    selectedCatagory =
        (index == 0) ? CatagoryType.income : CatagoryType.expense;
    update();
  }

  changeCatagory(newValue) {
    selectedCatagory = newValue;
    update();
  }
}

class UpdateController extends GetxController {
  late CatagoryType catagory;
  late PaymentMode mode;
  late DateTime date;
  updateDate(DateTime newDate) {
    date = newDate;
    update();
  }

  changePaymentMode(PaymentMode newValue) {
    mode = newValue;
    update();
  }

  changeCatagory(newValue) {
    catagory = newValue;
    update();
  }
}
