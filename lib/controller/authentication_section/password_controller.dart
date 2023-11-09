import 'package:expense_tracker/models/transaction_model/transaction_model.dart';

import 'package:get/get.dart';

class PasswordController extends GetxController {
  RxBool visibility = true.obs;
  void changeVisibility(bool value) {
    visibility.value = !visibility.value;
  }
}

///date picker

//

//

//
class UpdateController extends GetxController {
  late TransactionType transaction;
  late PaymentMode mode;
  late String? catagory;
  late DateTime date;
  bool iscatagoryVisible = false;
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
    iscatagoryVisible = transaction == TransactionType.income ? false : true;
    // catagory = null;

    update();
  }

  changeCategoryType(newValue) {
    catagory = newValue;
    update();
  }

  isContainervisible() {
    iscatagoryVisible = transaction == TransactionType.income ? false : true;
    update();
  }
}
