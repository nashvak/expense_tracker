import 'package:expense_tracker/controller/transaction_contollers/transaction_controller.dart';
import 'package:expense_tracker/models/transaction_model/transaction_model.dart';
import 'package:get/get.dart';

class BalanceController extends GetxController {
  TransactionController transactionController = TransactionController();
  // F U N C T I O N   T O   D I S P L A Y   T H E   T O T A L   I N C O M E
  double get totalIncome {
    return transactionController.sortedList
        .where((transaction) =>
            transaction.transactionType == TransactionType.income)
        .fold(0.0, (sum, item) => sum + item.amount);
  }

// F U N C T I O N   T O   D I S P L A Y   T H E   T O T A L   E X P E N S E
  double get totalExpense {
    return transactionController.sortedList
        .where((transaction) =>
            transaction.transactionType == TransactionType.expense)
        .fold(0.0, (sum, item) => sum + item.amount);
  }

  double get totalBalance => totalIncome - totalExpense;
}
