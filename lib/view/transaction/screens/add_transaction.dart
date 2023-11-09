import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/button.dart';
import 'package:expense_tracker/controller/transaction_contollers/add_transaction_ui_controller.dart';
import 'package:expense_tracker/controller/transaction_contollers/transaction_controller.dart';
import 'package:expense_tracker/models/transaction_model/transaction_model.dart';
import 'package:expense_tracker/view/transaction/screens/toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../constatnts/custom_widgets/common/sizedbox.dart';
import '../../../constatnts/custom_widgets/login&signup/textfield.dart';

class ScreenAddTransaction extends StatefulWidget {
  const ScreenAddTransaction({super.key});

  @override
  State<ScreenAddTransaction> createState() => _ScreenAddTransactionState();
}

class _ScreenAddTransactionState extends State<ScreenAddTransaction> {
  final addFormkey = GlobalKey<FormState>();
  final amountController = TextEditingController();
  final dateController = TextEditingController();
  final descriptionController = TextEditingController();

  // DateTime? pickedDate;
  final TransactionController controller = Get.put(TransactionController());
  final UiController ui = Get.put(UiController());
  addTransaction() {
    if (addFormkey.currentState!.validate()) {
      Transaction transaction = Transaction(
        description: descriptionController.text,
        amount: int.parse(amountController.text),
        date: ui.selectedDate,
        paymentMode: ui.selectedPaymentMode!,
        transactionType: ui.selectedTransactionType,
        catagoryType: ui.selectedTransactionType == TransactionType.income
            ? null
            : ui.selectedCategory,
      );
      controller.createTransaction(transaction: transaction, context: context);

      Get.back();
      ui.resetValues();
      descriptionController.clear();
      amountController.clear();
      dateController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Form(
            key: addFormkey,
            child: Column(
              children: [
                const CustomToggleSwitch(),
                const BlankSpace(
                  height: 50,
                ),

                CustomTextField(
                  validator: (value) {
                    return null;
                  },
                  controller: amountController,
                  title: 'Amount',
                ),
                BlankSpace(
                  height: 30,
                ),
                GetBuilder<UiController>(
                  builder: (controller) {
                    return Visibility(
                      visible: controller.isDropdownVisible,
                      child: DropdownButtonFormField<String>(
                        hint: const Text('Catagory '),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Appcolor.tertiaryColor, width: 1),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Appcolor.tertiaryColor, width: 1),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          filled: true,
                          fillColor: Appcolor.tertiaryColor,
                        ),
                        validator: (value) =>
                            value == null ? "Select Category" : null,
                        dropdownColor: Appcolor.tertiaryColor,
                        value: controller.selectedCategory,
                        onChanged: (String? newValue) {
                          controller.changeCatagory(newValue!);
                        },
                        items: controller.catagoryTypes.map((String mode) {
                          return DropdownMenuItem<String>(
                            value: mode,
                            child: Text(mode.toString().split('.').last),
                          );
                        }).toList(),
                      ),
                    );
                  },
                ),
                BlankSpace(
                  height: 30,
                ),
                GetBuilder<UiController>(
                  builder: (controller) {
                    return CustomTextField(
                      readonly: true,
                      validator: (value) {
                        return null;
                      },
                      controller: dateController,
                      title: 'Date',
                      ontap: () async {
                        await controller.getDate(context);

                        dateController.text = DateFormat('dd/MM/yyyy')
                            .format(controller.selectedDate);
                        //   }
                      },
                    );
                  },
                ),
                BlankSpace(
                  height: 30,
                ),
                CustomTextField(
                  validator: (value) {
                    return null;
                  },
                  controller: descriptionController,
                  title: 'Description',
                ),
                BlankSpace(
                  height: 30,
                ),
                GetBuilder<UiController>(
                  builder: (controller) {
                    return DropdownButtonFormField<PaymentMode>(
                      hint: const Text('Payment mode '),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Appcolor.tertiaryColor, width: 1),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Appcolor.tertiaryColor, width: 1),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        filled: true,
                        fillColor: Appcolor.tertiaryColor,
                      ),
                      validator: (value) =>
                          value == null ? "Select Payment mode" : null,
                      dropdownColor: Appcolor.tertiaryColor,
                      value: controller.selectedPaymentMode,
                      onChanged: (PaymentMode? newValue) {
                        controller.changePaymentMode(newValue!);
                      },
                      items: PaymentMode.values.map((PaymentMode mode) {
                        return DropdownMenuItem<PaymentMode>(
                          value: mode,
                          child: Text(mode.toString().split('.').last),
                        );
                      }).toList(),
                    );
                  },
                ),

                const BlankSpace(
                  height: 40,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     SizedBox(
                //       width: Get.width / 2.5,
                //       child: Cancelbutton(
                //         title: 'Cancel',
                //         onTap: () {
                //           Get.back();
                //         },
                //       ),
                //     ),
                //     SizedBox(
                //       width: Get.width / 2.5,
                //       child: CustomButton(
                //         title: 'Add',
                //         onTap: () {
                //           addTransaction();
                //         },
                //       ),
                //     ),
                //   ],
                // ),
                CustomButton(
                    title: "Add Transaction",
                    onTap: () {
                      addTransaction();
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
