import 'package:expense_tracker/controller/filer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilteringName extends StatelessWidget {
  const FilteringName({
    super.key,
    // required this.filterController,
  });

  // final FilterController filterController;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterController>(builder: ((controller) {
      return Text(
        controller.selectedOption.toString().capitalize!,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      );
    }));
  }
}
