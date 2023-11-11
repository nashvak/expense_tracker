import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/button.dart';
import 'package:expense_tracker/controller/transaction_contollers/transaction_ui_controller.dart';
import 'package:expense_tracker/controller/transaction_contollers/transaction_controller.dart';
import 'package:expense_tracker/models/transaction_model/transaction_model.dart';
import 'package:expense_tracker/view/transaction/screens/add_category.dart';
import 'package:expense_tracker/view/transaction/screens/toggle_switch.dart';
import 'package:expense_tracker/view/transaction/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  final TransactionController controller = Get.put(TransactionController());
  final UiController ui = Get.put(UiController());
  addTransaction() {
    if (addFormkey.currentState!.validate()) {
      Transaction transaction = Transaction(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        description: descriptionController.text,
        amount: double.parse(amountController.text),
        date: ui.selectedDate,
        paymentMode: ui.selectedPaymentMode!,
        transactionType: ui.selectedTransactionType,
        catagoryType: ui.selectedCategory!,
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
  void initState() {
    dateController.text = DateFormat('dd/MM/yyyy').format(ui.selectedDate);
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
                AddTransactionTextField(
                  type: TextInputType.numberWithOptions(decimal: true),
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
                      style: TextStyle(fontSize: 17),
                    ),
                    const BlankSpace(
                      width: 30,
                    ),
                    Container(
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                          Get.to(() => const AddCategory());
                        },
                        child: const Icon(Icons.add)),
                  ],
                ),
                const BlankSpace(
                  height: 30,
                ),
                GetBuilder<UiController>(
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

                        dateController.text = DateFormat('dd/MM/yyyy')
                            .format(controller.selectedDate);
                        //   }
                      },
                    );
                  },
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
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(
                      width: Get.width * 0.6,
                      child: GetBuilder<UiController>(
                        builder: (controller) {
                          return DropdownButtonFormField<PaymentMode>(
                            hint: const Text('Payment mode '),
                            // autovalidateMode:
                            //     AutovalidateMode.onUserInteraction,
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
