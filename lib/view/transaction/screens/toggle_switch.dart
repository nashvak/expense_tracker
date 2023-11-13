import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/controller/transaction_contollers/transaction_ui_controller.dart';
import 'package:expense_tracker/models/transaction_model/transaction_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CustomToggleSwitch extends StatelessWidget {
  const CustomToggleSwitch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UiController>(
      builder: (controller) {
        return ToggleSwitch(
          initialLabelIndex:
              controller.selectedTransactionType == TransactionType.income
                  ? 0
                  : 1,
          minWidth: 100,
          minHeight: 50,
          cornerRadius: 10,
          fontSize: 17,
          activeBgColor: const [Appcolor.primaryColor],
          activeFgColor: Colors.white,
          inactiveBgColor: const Color.fromARGB(255, 191, 224, 230),
          totalSwitches: 2,
          labels: const ['Income', 'Expense'],
          onToggle: (index) {
            controller.changeToggle(index);
          },
        );
      },
    );
  }
}
