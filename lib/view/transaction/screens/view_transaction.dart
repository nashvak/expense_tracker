import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/button.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/decoration.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/sizedbox.dart';
import 'package:expense_tracker/controller/transaction_contollers/update_ui_controller.dart';
import 'package:expense_tracker/controller/transaction_contollers/transaction_ui_controller.dart';
import 'package:expense_tracker/controller/transaction_contollers/transaction_controller.dart';

import 'package:expense_tracker/models/transaction_model/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ScreenViewTransaction extends StatefulWidget {
  const ScreenViewTransaction({super.key});

  @override
  State<ScreenViewTransaction> createState() => _ScreenViewTransactionState();
}

class _ScreenViewTransactionState extends State<ScreenViewTransaction> {
  final int index = Get.arguments;

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
  bool iscatagoryVisible = false;
  @override
  void initState() {
    Transaction tr = transactionController.sortedList[index];

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
    super.initState();
  }

  updateTransaction() {
    if (updateFormkey.currentState!.validate()) {
      Transaction tr = Transaction(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        description: descriptionController.text,
        amount: double.parse(amountController.text),
        date: updateController.date,
        paymentMode: updateController.mode,
        transactionType: updateController.transaction,
        catagoryType: updateController.catagory,
      );
      transactionController.updateTransaction(
          index: index, transaction: tr, context: context);

      Get.back();
    }
  }

  // deleteDialog(int index) {
  //   Get.defaultDialog(
  //     title: 'Delete record',
  //     middleText: 'Do you want to delete this record',
  //     backgroundColor: Appcolor.white,
  //     radius: 20,
  //     contentPadding: const EdgeInsets.all(10),
  //     titlePadding: const EdgeInsets.all(20),
  //     textCancel: 'Cancel', //default style
  //     textConfirm: 'Ok',
  //     cancelTextColor: Appcolor.primaryColor,
  //     onCancel: () {
  //       Get.back();
  //     },
  //     onConfirm: () {
  //       transactionController.deleteTransaction(index: index, context: context);
  //       Get.back();
  //     },
  //     buttonColor: Colors.white,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    Transaction tr = transactionController.sortedList[index];
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
                  updateController.deleteDialog(index);
                },
                child: const Icon(
                  Icons.delete,
                  color: Appcolor.primaryColor,
                ),
              ))
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
                              items: PaymentMode.values.map((PaymentMode mode) {
                                return DropdownMenuItem<PaymentMode>(
                                  value: mode,
                                  child: Text(mode.toString().split('.').last),
                                );
                              }).toList(),
                              value: controller.mode);
                        },
                      ),
                    ],
                  ),
                ),
                height30,
                Container(
                  decoration: cardDecoration(color: Colors.white),
                  height: MediaQuery.of(context).size.height / 7,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Appcolor.primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                                padding: const EdgeInsets.all(10),
                                child:
                                    tr.transactionType == TransactionType.income
                                        ? const Icon(
                                            Icons.arrow_upward,
                                            color: Colors.white,
                                          )
                                        : const Icon(
                                            Icons.arrow_downward,
                                            color: Colors.white,
                                          )),
                          ),
                          const BlankSpace(
                            width: 15,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: descriptionController,
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
                                              DateFormat('dd/MM/yyyy')
                                                  .format(dates);
                                        }
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const BlankSpace(
                  height: 30,
                ),
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
                        'Amount',
                        style: TextStyle(color: Appcolor.primaryColor),
                      ),
                      TextFormField(
                        controller: amountController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                ),
                const BlankSpace(
                  height: 30,
                ),
                GetBuilder<UpdateController>(
                  builder: (controller) {
                    return Container(
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
                            'Catagory type',
                            style: TextStyle(color: Appcolor.primaryColor),
                          ),
                          DropdownButton<String>(
                              onChanged: (String? newValue) {
                                controller.changeCategoryType(newValue);
                              },
                              items: ui.incomeCatagoryTypes.map((String mode) {
                                return DropdownMenuItem<String>(
                                  value: mode,
                                  child: Text(mode.toString().split('.').last),
                                );
                              }).toList(),
                              value: controller.catagory),
                        ],
                      ),
                    );
                  },
                ),
                const BlankSpace(
                  height: 30,
                ),
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
                const BlankSpace(
                  height: 30,
                ),
                CustomButton(
                    title: 'Update Transaction',
                    onTap: () {
                      updateTransaction();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
