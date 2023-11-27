import 'package:expense_tracker/constatnts/custom_widgets/home_screen/button.dart';
import 'package:expense_tracker/controller/filer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateRangeFiltering extends StatelessWidget {
  const DateRangeFiltering({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterController>(
      builder: (controller) {
        return SortButton(
          ontap: () {
            controller.selectDateRange();
          },
          title: 'Date',
          icon: const Icon(Icons.arrow_drop_down),
        );
      },
    );
  }
}
