//   B A L A N C E   C A R D

import 'package:expense_tracker/controller/transaction_contollers/balance_calculation_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BalanceCard extends StatelessWidget {
  BalanceCard({
    super.key,
  });
  final BalanceController balanceController = Get.put(BalanceController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.center,
          child: Text(
            "BALANCE",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        Align(
            alignment: Alignment.center,
            child: GetBuilder<BalanceController>(builder: (controller) {
              return Text(
                "₹ ${controller.totalBalance}",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              );
            })),
      ],
    );
  }
}
