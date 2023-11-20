import 'package:expense_tracker/controller/transaction_contollers/transaction_ui_controller.dart';
import 'package:expense_tracker/models/transaction_model/transaction_model.dart';

import 'package:get/get.dart';

class UpdateController extends GetxController {
  UiController uiController = UiController();
  late TransactionType transaction;
  late PaymentMode mode;
  late String? catagory;
  late DateTime date;

  //   U P D A T E   D A T E
  updateDate(DateTime newDate) {
    date = newDate;
    update();
  }

//  U P D A T E   P A Y M E N T    M O D E
  changePaymentMode(PaymentMode newValue) {
    mode = newValue;
    update();
  }

  changeTransactionType(newValue) {
    transaction = newValue;
    // iscatagoryVisible = transaction == TransactionType.income ? false : true;
    // catagory = null;

    update();
  }

  // changeCategoryType(newValue) {
  //   catagory = newValue;
  //   update();
  // }

  displayCategory() {
    if (transaction == TransactionType.income) {
      return uiController.incomeCategorybox.values.toList();
    } else {
      return uiController.expenseCategorybox.values.toList();
    }
  }
}
