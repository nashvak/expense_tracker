import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/button.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/decoration.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/sizedbox.dart';

import 'package:expense_tracker/controller/transaction_contollers/update_ui_controller.dart';
import 'package:expense_tracker/controller/transaction_contollers/transaction_ui_controller.dart';
import 'package:expense_tracker/controller/transaction_contollers/transaction_controller.dart';

import 'package:expense_tracker/models/transaction_model/transaction_model.dart';
import 'package:expense_tracker/view/transaction/screens/view_transaction/widgets/amount_details_section.dart';
import 'package:expense_tracker/view/transaction/screens/view_transaction/widgets/transaction_details_section.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ScreenViewTransaction extends StatefulWidget {
  const ScreenViewTransaction({super.key});

  @override
  State<ScreenViewTransaction> createState() => _ScreenViewTransactionState();
}

class _ScreenViewTransactionState extends State<ScreenViewTransaction> {
  final String editId = Get.arguments;

  final TransactionController transactionController = Get.put(
    TransactionController(),
  );
  final UpdateController updateController = Get.put(
    UpdateController(),
  );
  final UiController ui = Get.put(
    UiController(),
  );

  final updateFormkey = GlobalKey<FormState>();

  TextEditingController amountController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    initialization();
    super.initState();
  }

  void initialization() {
    Transaction tr = transactionController.sortedList
        .firstWhere((transaction) => transaction.id == editId);

    amountController = TextEditingController(
      text: tr.amount.toString(),
    );
    descriptionController = TextEditingController(text: tr.description);
    updateController.date = tr.date;
    dateController = TextEditingController(
      text: DateFormat('dd/MM/yyyy').format(updateController.date),
    );
    updateController.transaction = tr.transactionType;
    updateController.mode = tr.paymentMode;
    updateController.catagory = tr.catagoryType;
    // updateController.isContainervisible();
  }

  updateTransaction() {
    if (updateFormkey.currentState!.validate()) {
      Transaction tr = Transaction(
        id: editId,
        description: descriptionController.text,
        amount: double.parse(amountController.text),
        date: updateController.date,
        paymentMode: updateController.mode,
        transactionType: updateController.transaction,
        catagoryType: updateController.catagory,
      );
      transactionController.updateTransaction(
          id: editId, transaction: tr, context: context);

      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    Transaction tr = transactionController.sortedList
        .firstWhere((transaction) => transaction.id == editId);
    return Scaffold(
      backgroundColor: Appcolor.tertiaryColor,
      appBar: AppBar(
        titleSpacing: 8,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: const Text(
          "Edit",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                updateController.deleteDialog(editId);
              },
              child: const Icon(
                Icons.delete,
                color: Appcolor.primaryColor,
              ),
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: updateFormkey,
            child: Column(
              children: [
                Container(
                  decoration: cardDecoration(color: Colors.white),
                  height: MediaQuery.of(context).size.height / 9,
                  width: MediaQuery.of(context).size.width / 1,
                  padding: const EdgeInsets.only(left: 20),
                  //color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Transaction type',
                        style: TextStyle(color: Appcolor.primaryColor),
                      ),
                      GetBuilder<UpdateController>(
                        builder: (controller) {
                          return DropdownButton<TransactionType>(
                              onChanged: (TransactionType? newValue) {
                                controller.changeTransactionType(newValue);
                              },
                              items: TransactionType.values
                                  .map((TransactionType mode) {
                                return DropdownMenuItem<TransactionType>(
                                  value: mode,
                                  child: Text(mode.toString().split('.').last),
                                );
                              }).toList(),
                              value: controller.transaction);
                        },
                      ),
                    ],
                  ),
                ),
                height30,
                Container(
                  decoration: cardDecoration(color: Colors.white),
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Transaction details',
                        style: TextStyle(color: Appcolor.primaryColor),
                      ),
                      TransactionDetails(
                          tr: tr,
                          descriptionController: descriptionController,
                          dateController: dateController)
                    ],
                  ),
                ),
                const BlankSpace(
                  height: 30,
                ),
                AmountDetails(amountController: amountController),
                const BlankSpace(
                  height: 30,
                ),
                GetBuilder<UpdateController>(
                  builder: (controller) {
                    // List<String> category =
                    //     tr.transactionType == TransactionType.income
                    //         ? ui.incomeCatagoryTypes
                    //         : ui.expenseCatagoryTypes;
                    return Container(
                      decoration: cardDecoration(color: Appcolor.white),
                      height: MediaQuery.of(context).size.height / 8,
                      width: MediaQuery.of(context).size.width / 1,
                      // padding: const EdgeInsets.only(left: 20),
                      //color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Catagory type',
                                style: TextStyle(color: Appcolor.primaryColor),
                              ),
                              GetBuilder<UpdateController>(
                                builder: (controller) {
                                  List<String> a = ui.showCategoryDropdown();
                                  return DropdownButton<String>(
                                      onChanged: (String? newValue) {
                                        controller.changeCategoryType(newValue);
                                      },
                                      items: a.map((String mode) {
                                        return DropdownMenuItem<String>(
                                          value: mode,
                                          child: Text(
                                              mode.toString().split('.').last),
                                        );
                                      }).toList(),
                                      value: controller.catagory);
                                },
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Payment mode',
                                style: TextStyle(color: Appcolor.primaryColor),
                              ),
                              GetBuilder<UpdateController>(
                                builder: (controller) {
                                  return DropdownButton<PaymentMode>(
                                      onChanged: (PaymentMode? newValue) {
                                        // setState(() {
                                        //   selectedPaymentMode = newValue!;
                                        // });
                                        controller.changePaymentMode(newValue!);
                                      },
                                      items: PaymentMode.values.map(
                                        (PaymentMode mode) {
                                          return DropdownMenuItem<PaymentMode>(
                                            value: mode,
                                            child: Text(mode
                                                .toString()
                                                .split('.')
                                                .last),
                                          );
                                        },
                                      ).toList(),
                                      value: controller.mode);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const BlankSpace(
                  height: 30,
                ),
                SignupButton(
                  title: 'Update Transaction',
                  onTap: () {
                    updateTransaction();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
