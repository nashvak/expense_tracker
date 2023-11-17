//   B A L A N C E   C A R D

import 'package:expense_tracker/controller/transaction_contollers/balance_calculation_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_formatter/money_formatter.dart';

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
              MoneyFormatter fmf =
                  MoneyFormatter(amount: controller.totalBalance);
              return Text(
                "₹ ${fmf.output.compactNonSymbol}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Colors.white,
                    //  overflow: TextOverflow.ellipsis,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              );
            })),
      ],
    );
  }
}
