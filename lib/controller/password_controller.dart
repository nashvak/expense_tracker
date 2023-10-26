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
  var selectedDate = DateTime.now();
  updateDate(DateTime newDate) {
    selectedDate = newDate;
    update();
  }

  changePaymentMode(PaymentMode newValue) {
    selectedPaymentMode = newValue;
  }
}
