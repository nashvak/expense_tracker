import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/controller/filer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteButton extends StatelessWidget {
  DeleteButton({
    super.key,
    required this.editId,
  });

  final FilterController filterController = Get.put(FilterController());
  final String editId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: GestureDetector(
        onTap: () async {
          await filterController.deleteDialog(editId);
        },
        child: const Icon(
          Icons.delete,
          color: Appcolor.primaryColor,
        ),
      ),
    );
  }
}
