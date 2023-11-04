import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/button.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/decoration.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/sizedbox.dart';
import 'package:expense_tracker/controller/password_controller.dart';
import 'package:expense_tracker/controller/transaction_controller.dart';
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
  final UpdateController ui = Get.put(
    UpdateController(),
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
    ui.date = tr.date;
    dateController = TextEditingController(
      text: DateFormat('dd/MM/yyyy').format(ui.date),
    );
    ui.transaction = tr.transactionType;
    ui.mode = tr.paymentMode;
    ui.catagory = tr.catagoryType;
    ui.isContainervisible();
    super.initState();
  }

  updateTransaction() {
    if (updateFormkey.currentState!.validate()) {
      Transaction tr = Transaction(
        description: descriptionController.text,
        amount: int.parse(amountController.text),
        date: ui.date,
        paymentMode: ui.mode,
        transactionType: ui.transaction,
        catagoryType: ui.catagory,
      );

      transactionController.updateTransaction(index: index, transaction: tr);
      // print(index);

      Get.back();
    }
  }

  deleteDialog() {
    Get.defaultDialog(
      title: 'Delete record',
      middleText: 'Do you want to delete this record',
      backgroundColor: Appcolor.primaryColor,
      radius: 40,
      contentPadding: const EdgeInsets.all(10),
      titlePadding: const EdgeInsets.all(20),
      textCancel: 'Cancel', //default style
      textConfirm: 'Ok',
      cancelTextColor: Colors.white,
      onCancel: () {},
      onConfirm: () {},
      buttonColor: Colors.white,
    );
  }

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
                  deleteDialog();
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
                            child: const Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(
                                Icons.phone,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const BlankSpace(
                            width: 15,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: descriptionController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: tr.description,
                                  ),
                                ),
                                GetBuilder<UpdateController>(builder: (cont) {
                                  return TextFormField(
                                    controller: dateController,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    onTap: () async {
                                      DateTime? dates = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
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
                                })
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
                    return Visibility(
                      visible: controller.iscatagoryVisible,
                      child: Container(
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
                            DropdownButton<CatagoryType>(
                                onChanged: (CatagoryType? newValue) {
                                  // setState(() {
                                  //   selectedPaymentMode = newValue!;
                                  // });
                                  controller.changeCategoryType(newValue);
                                },
                                items: CatagoryType.values
                                    .map((CatagoryType mode) {
                                  return DropdownMenuItem<CatagoryType>(
                                    value: mode,
                                    child:
                                        Text(mode.toString().split('.').last),
                                  );
                                }).toList(),
                                value: controller.catagory),
                          ],
                        ),
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
                                // setState(() {
                                //   selectedPaymentMode = newValue!;
                                // });
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
