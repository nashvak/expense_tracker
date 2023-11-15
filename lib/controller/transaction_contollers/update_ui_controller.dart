import 'package:expense_tracker/models/transaction_model/transaction_model.dart';

import 'package:get/get.dart';

class UpdateController extends GetxController {
  late TransactionType transaction;
  late PaymentMode mode;
  late String catagory;
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

  changeCategoryType(newValue) {
    catagory = newValue;
    update();
  }

  // isContainervisible() {
  //   iscatagoryVisible = transaction == TransactionType.income ? false : true;
  //   update();
  // }
}
