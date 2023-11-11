import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/controller/transaction_contollers/transaction_controller.dart';
import 'package:expense_tracker/models/transaction_model/transaction_model.dart';

import 'package:flutter/material.dart';
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
  TransactionController transactionController = TransactionController();
  deleteDialog(int index) {
    Get.defaultDialog(
      title: 'Delete record',
      middleText: 'Do you want to delete this record',
      backgroundColor: Appcolor.white,
      radius: 20,
      contentPadding: const EdgeInsets.all(10),
      titlePadding: const EdgeInsets.all(20),
      textCancel: 'Cancel', //default style
      textConfirm: 'Ok',
      cancelTextColor: Appcolor.primaryColor,
      onCancel: () {
        Get.back();
      },
      onConfirm: () async {
        transactionController.deleteTransaction(index: index);
        Get.back();
        Get.back();
      },
      buttonColor: Colors.white,
    );
    update();
  }
}
