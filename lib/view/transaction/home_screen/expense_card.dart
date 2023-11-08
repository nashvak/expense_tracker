//    E X P E N S E    C A R D
import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/controller/transaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: Appcolor.white,
          child: Icon(
            Icons.arrow_upward,
            color: Colors.red,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Expense",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                )),
            GetBuilder<TransactionController>(
              builder: (controller) {
                return Text(
                  "₹ ${controller.totalExpense}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
