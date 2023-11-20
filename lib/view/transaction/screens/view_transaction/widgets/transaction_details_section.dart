import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/sizedbox.dart';
import 'package:expense_tracker/controller/transaction_contollers/update_ui_controller.dart';
import 'package:expense_tracker/models/transaction_model/transaction_model.dart';
import 'package:expense_tracker/view/transaction/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';

class TransactionDetails extends StatelessWidget {
  const TransactionDetails({
    super.key,
    required this.tr,
    required this.descriptionController,
    required this.dateController,
  });

  final Transaction tr;
  final TextEditingController descriptionController;
  final TextEditingController dateController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Appcolor.primaryColor,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: tr.transactionType == TransactionType.income
                ? const Icon(
                    Icons.arrow_upward,
                    color: Colors.white,
                    size: 30,
                  )
                : const Icon(
                    Icons.arrow_downward,
                    color: Colors.white,
                    size: 30,
                  ),
          ),
        ),
        const BlankSpace(
          width: 15,
        ),
        Expanded(
          child: Container(
            //color: Colors.red,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: descriptionController,
                  validator: descriptionValidator,
                  decoration: const InputDecoration(
                    border: InputBorder.none,

                    // hintText: tr.description,
                  ),
                ),
                GetBuilder<UpdateController>(
                  builder: (cont) {
                    return TextFormField(
                      controller: dateController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      onTap: () async {
                        DateTime? dates = await showDatePicker(
                            context: context,
                            initialDate: tr.date,
                            firstDate: DateTime(2023),
                            lastDate: DateTime(2024));

                        if (dates != null) {
                          cont.updateDate(dates);
                          // setState(() {});
                          dateController.text =
                              DateFormat('dd/MM/yyyy').format(dates);
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
