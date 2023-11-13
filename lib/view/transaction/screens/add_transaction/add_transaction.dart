import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/button.dart';
import 'package:expense_tracker/controller/date&time_controller/date_picker_controller.dart';
import 'package:expense_tracker/controller/transaction_contollers/transaction_ui_controller.dart';
import 'package:expense_tracker/controller/transaction_contollers/transaction_controller.dart';
import 'package:expense_tracker/models/transaction_model/transaction_model.dart';
import 'package:expense_tracker/view/transaction/screens/add_transaction/widgets/add_category.dart';
import 'package:expense_tracker/view/transaction/screens/add_transaction/widgets/toggle_switch.dart';
import 'package:expense_tracker/view/transaction/validators/validators.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constatnts/custom_widgets/common/sizedbox.dart';
import '../../../../constatnts/custom_widgets/login&signup/textfield.dart';

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

  final TransactionController transactionController =
      Get.put(TransactionController());
  final UiController ui = Get.put(UiController());
  final DatePickerController date = Get.put(DatePickerController());

  addTransaction() async {
    if (addFormkey.currentState!.validate()) {
      Transaction transaction = Transaction(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        description: descriptionController.text,
        amount: double.parse(amountController.text),
        date: date.selectedDate,
        paymentMode: ui.selectedPaymentMode!,
        transactionType: ui.selectedTransactionType,
        catagoryType: ui.selectedCategory!,
      );
      transactionController.createTransaction(
          transaction: transaction, context: context);

      ui.resetValues();

      date.resetDate();

      descriptionController.clear();
      amountController.clear();
      dateController.text = await date.dateFormat();
    }
  }

  Future<void> dateInitialization() async {
    dateController.text = await date.dateFormat();
  }

  @override
  void initState() {
    dateInitialization();

    super.initState();
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
                const BlankSpace(height: 50),
                GetBuilder<DatePickerController>(
                  builder: (controller) {
                    return AddTransactionTextField(
                      readonly: true,
                      validator: (value) {
                        return null;
                      },
                      controller: dateController,
                      title: 'Date',
                      ontap: () async {
                        await controller.getDate(context);

                        dateController.text = await controller.dateFormat();

                        //   }
                      },
                    );
                  },
                ),
                const BlankSpace(
                  height: 30,
                ),
                AddTransactionTextField(
                  type: const TextInputType.numberWithOptions(decimal: true),
                  validator: amountValidator,
                  controller: amountController,
                  title: 'Amount',
                ),
                const BlankSpace(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Category',
                      style: TextStyle(fontSize: 15),
                    ),
                    const BlankSpace(
                      width: 30,
                    ),
                    SizedBox(
                      width: Get.width * 0.5,
                      child: GetBuilder<UiController>(
                        builder: (controller) {
                          return DropdownButtonFormField<String>(
                            //hint: const Text('Catagory '),
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Appcolor.secondaryColor, width: 1),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Appcolor.primaryColor, width: 1),
                              ),
                            ),
                            iconSize: 0,
                            // autovalidateMode:
                            //     AutovalidateMode.onUserInteraction,
                            validator: (value) =>
                                value == null ? "Select Category" : null,
                            // dropdownColor: Appcolor.tertiaryColor,
                            value: controller.selectedCategory,
                            onChanged: (String? newValue) {
                              controller.changeCatagory(newValue!);
                            },
                            items: controller
                                .showCategoryDropdown()
                                .map((String mode) {
                              return DropdownMenuItem<String>(
                                value: mode,
                                child: Text(mode),
                              );
                            }).toList(),
                          );
                        },
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          Get.to(() => AddCategory());
                        },
                        child: const Icon(Icons.add)),
                  ],
                ),
                const BlankSpace(
                  height: 30,
                ),
                AddTransactionTextField(
                  validator: descriptionValidator,
                  controller: descriptionController,
                  title: 'Description',
                ),
                const BlankSpace(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Account',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      width: Get.width * 0.6,
                      child: GetBuilder<UiController>(
                        builder: (controller) {
                          return DropdownButtonFormField<PaymentMode>(
                            hint: const Text('Payment mode '),
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Appcolor.secondaryColor, width: 1),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Appcolor.primaryColor, width: 1),
                              ),
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
                    ),
                  ],
                ),
                const BlankSpace(
                  height: 40,
                ),
                SignupButton(
                    title: "Add ",
                    onTap: () {
                      addTransaction();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}