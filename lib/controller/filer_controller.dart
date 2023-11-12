import 'package:expense_tracker/controller/transaction_contollers/transaction_controller.dart';
import 'package:get/get.dart';

class FilterController extends GetxController {
  TransactionController transactionController = TransactionController();

  //  C A T E G O R Y   I S    D I S P L A Y I N G    I N    T H E   B O T T O M   S H E E T

  List<String> isCatagoryIncluded() {
    Set<String?> currentCatagory = {};
    List<String> catagoryTitles = [];
    for (var transaction in transactionController.sortedList) {
      currentCatagory.add(transaction.catagoryType);
      currentCatagory.removeWhere((value) => value == null);
      catagoryTitles = currentCatagory
          .map((category) => category.toString().split('.').last)
          .toList();
    }
    // print(catagoryTitles);
    return catagoryTitles;
  }
}
