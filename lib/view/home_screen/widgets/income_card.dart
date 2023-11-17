//   I N C O M E    C A R D
import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/controller/transaction_contollers/balance_calculation_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_formatter/money_formatter.dart';

class IncomeCard extends StatelessWidget {
  IncomeCard({
    super.key,
  });
  final BalanceController balanceController = Get.put(BalanceController());
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: Appcolor.white,
          child: Icon(
            Icons.arrow_downward,
            color: Colors.green,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Income",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            GetBuilder<BalanceController>(
              builder: (controller) {
                MoneyFormatter fmf =
                    MoneyFormatter(amount: controller.totalIncome);
                return Text(
                  "₹ ${fmf.output.compactNonSymbol}",
                  style: const TextStyle(
                      color: Colors.white,
                      overflow: TextOverflow.ellipsis,
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
