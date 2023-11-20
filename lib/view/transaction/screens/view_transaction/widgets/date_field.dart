import 'package:expense_tracker/constatnts/custom_widgets/login&signup/textfield.dart';
import 'package:expense_tracker/controller/transaction_contollers/update_ui_controller.dart';
import 'package:expense_tracker/models/transaction_model/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Datefields extends StatelessWidget {
  const Datefields({
    super.key,
    required this.dateController,
    required this.tr,
  });

  final TextEditingController dateController;
  final Transaction tr;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateController>(
      builder: (cont) {
        return AddTransactionTextField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter a date';
            }
            return null;
          },
          controller: dateController,
          readonly: true,
          title: 'Date',
          ontap: () async {
            DateTime? dates = await showDatePicker(
                context: context,
                initialDate: tr.date,
                firstDate: DateTime(2023),
                lastDate: DateTime(2024));

            if (dates != null) {
              cont.updateDate(dates);
              // setState(() {});
              dateController.text = DateFormat('dd/MM/yyyy').format(dates);
            }
          },
        );
      },
    );
  }
}
