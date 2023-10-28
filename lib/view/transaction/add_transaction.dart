import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/button.dart';
import 'package:expense_tracker/controller/password_controller.dart';
import 'package:expense_tracker/controller/transaction_controller.dart';
import 'package:expense_tracker/models/transaction_model/transaction_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../constatnts/custom_widgets/common/sizedbox.dart';
import '../../constatnts/custom_widgets/login&signup/textfield.dart';

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

  DateTime? pickedDate;
  final TransactionController controller = Get.put(TransactionController());
  final UiController ui = Get.put(UiController());
  addTransaction() {
    if (addFormkey.currentState!.validate()) {
      // print('hello');
      Transaction transaction = Transaction(
          description: descriptionController.text,
          amount: int.parse(amountController.text),
          date: pickedDate!,
          mode: ui.selectedPaymentMode!,
          type: ui.selectedCatagory);
      controller.createTransaction(transaction: transaction);

      Get.back();
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
                GetBuilder<UiController>(
                  builder: (controller) {
                    return ToggleSwitch(
                      initialLabelIndex:
                          controller.selectedCatagory == CatagoryType.income
                              ? 0
                              : 1,
                      minWidth: 120,
                      minHeight: 50,
                      cornerRadius: 10,
                      fontSize: 20,
                      activeBgColor: const [
                        Appcolor.primaryColor,
                      ],
                      activeFgColor: Colors.white,
                      inactiveBgColor: const Color.fromARGB(255, 191, 224, 230),
                      totalSwitches: 2,
                      labels: const ['Income', 'Expense'],
                      onToggle: (index) {
                        controller.changeToggle(index);
                        // setState(() {
                        //   selectedCatagory = (index == 0)
                        //       ? CatagoryType.income
                        //       : CatagoryType.expense;
                        //   // print(selectedCatagory);

                        // });
                      },
                    );
                  },
                ),
                height30,
                height20,
                CustomTextField(
                  obscure: false,
                  validator: (value) {
                    return null;
                  },
                  controller: descriptionController,
                  title: 'Description',
                ),
                height30,
                CustomTextField(
                  obscure: false,
                  validator: (value) {
                    return null;
                  },
                  controller: amountController,
                  title: 'Amount',
                ),
                height30,
                GetBuilder<UiController>(
                  builder: (controller) {
                    return CustomTextField(
                      readonly: true,
                      obscure: false,
                      validator: (value) {
                        return null;
                      },
                      controller: dateController,
                      title: 'Date',
                      ontap: () async {
                        pickedDate = await showDatePicker(
                            context: context,
                            initialDate: controller.selectedDate,
                            firstDate: DateTime(2023),
                            lastDate: DateTime(2024));

                        if (pickedDate != null) {
                          controller.updateDate(pickedDate!);

                          dateController.text = DateFormat('dd/MM/yyyy')
                              .format(controller.selectedDate);

                          // setState(() {});
                          // dateController.text =
                          //     DateFormat('dd/MM/yyyy').format(pickedDate!);
                        }
                      },
                    );
                  },
                ),
                height30,
                GetBuilder<UiController>(builder: (controller) {
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
                      // setState(() {
                      //   selectedPaymentMode = newValue!;

                      //   // print(selectedPaymentMode);
                      // });
                      controller.changePaymentMode(newValue!);
                    },
                    items: PaymentMode.values.map((PaymentMode mode) {
                      return DropdownMenuItem<PaymentMode>(
                        value: mode,
                        child: Text(mode
                            .toString()
                            .split('.')
                            .last), // To display the enum value as a string
                      );
                    }).toList(),
                  );
                }),
                height30,
                height20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Get.width / 2.5,
                      child: Cancelbutton(
                        title: 'Cancel',
                        onTap: () {
                          Get.back();
                        },
                      ),
                    ),
                    SizedBox(
                      width: Get.width / 2.5,
                      child: CustomButton(
                        title: 'Add',
                        onTap: () {
                          addTransaction();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
