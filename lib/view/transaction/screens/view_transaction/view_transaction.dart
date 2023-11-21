import 'dart:developer';
import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/button.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/decoration.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/sizedbox.dart';
import 'package:expense_tracker/constatnts/custom_widgets/login&signup/textfield.dart';
import 'package:expense_tracker/controller/filer_controller.dart';
import 'package:expense_tracker/controller/transaction_contollers/update_ui_controller.dart';
import 'package:expense_tracker/controller/transaction_contollers/transaction_ui_controller.dart';
import 'package:expense_tracker/controller/transaction_contollers/transaction_controller.dart';
import 'package:expense_tracker/models/transaction_model/transaction_model.dart';
import 'package:expense_tracker/view/transaction/screens/view_transaction/widgets/category_field.dart';
import 'package:expense_tracker/view/transaction/screens/view_transaction/widgets/date_field.dart';
import 'package:expense_tracker/view/transaction/screens/view_transaction/widgets/delete_button.dart';
import 'package:expense_tracker/view/transaction/snackbars/snackbar.dart';
import 'package:expense_tracker/view/transaction/validators/validators.dart';
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
  final FilterController filterController = Get.put(
    FilterController(),
  );
  final updateFormkey = GlobalKey<FormState>();

  TextEditingController amountController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  @override
  void initState() {
    initialization();
    super.initState();
  }

  void initialization() {
    Transaction tr = transactionController.sortedList
        .firstWhere((transaction) => transaction.id == editId);

    amountController = TextEditingController(text: tr.amount.toString());
    descriptionController = TextEditingController(text: tr.description);
    updateController.date = tr.date;
    categoryController.text = tr.catagoryType;
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
        catagoryType: categoryController.text,
      );
      // print(editId);
      filterController.updateTransaction(
          id: editId, transaction: tr, context: context);

      Get.back();
    } else {
      ToastUtil.showToast('Please fill all the fields in the form');
    }
  }

  // void _showDropdown(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         content: Column(
  //           children: [
  //             const Text('Choose an option:'),
  //             GetBuilder<UpdateController>(
  //               builder: (controller) {
  //                 List<String> a = ui.showCategoryDropdown();
  //                 return DropdownButtonFormField<String>(
  //                   value: controller.catagory,
  //                   items: a.map((String value) {
  //                     return DropdownMenuItem<String>(
  //                       value: value,
  //                       child: Text(value),
  //                     );
  //                   }).toList(),
  //                   onChanged: (String? newValue) async {
  //                     await controller.changeCategoryType(newValue);
  //                     categoryController.text = controller.catagory!;
  //                     Get.back();
  //                   },
  //                   //
  //                   // List<String> a = ui.showCategoryDropdown();
  //                   // print(a);
  //                   // return DropdownButtonFormField<String>(
  //                   //   hint: const Text('Select Catagory '),

  //                   //   decoration: const InputDecoration(
  //                   //     enabledBorder: UnderlineInputBorder(
  //                   //       borderSide: BorderSide(
  //                   //           color: Appcolor.secondaryColor, width: 1),
  //                   //     ),
  //                   //     focusedBorder: UnderlineInputBorder(
  //                   //       borderSide:
  //                   //           BorderSide(color: Appcolor.primaryColor, width: 1),
  //                   //     ),
  //                   //   ),
  //                   //   iconSize: 0,
  //                   //   // autovalidateMode:
  //                   //   //     AutovalidateMode.onUserInteraction,
  //                   //   validator: (value) =>
  //                   //       value == null ? "Select Category" : null,
  //                   //   // dropdownColor: Appcolor.tertiaryColor,
  //                   //   value: descriptionController.text,

  //                   //   onChanged: (String? newValue) {
  //                   //     controller.changeCategoryType(newValue!);
  //                   //   },
  //                   //   items: a.map((String? mode) {
  //                   //     return DropdownMenuItem<String>(
  //                   //       value: mode,
  //                   //       child: Text(mode!),
  //                   //     );
  //                   //   }).toList(),
  //                 );
  //               },
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

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
          DeleteButton(editId: editId),
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
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  //color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
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
                                    categoryController.text = '';
                                    controller.changeTransactionType(newValue);
                                  },
                                  items: TransactionType.values
                                      .map((TransactionType mode) {
                                    return DropdownMenuItem<TransactionType>(
                                      value: mode,
                                      child:
                                          Text(mode.toString().split('.').last),
                                    );
                                  }).toList(),
                                  value: controller.transaction);
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
                                        child: Text(
                                            mode.toString().split('.').last),
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
                ),

                const BlankSpace(
                  height: 30,
                ),
                Container(
                  decoration: cardDecoration(color: Colors.white),
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(
                      left: 20, top: 10, bottom: 20, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Datefields(dateController: dateController, tr: tr),
                      AddTransactionTextField(
                          validator: amountValidator,
                          controller: amountController,
                          title: 'Amout'),
                      AddTransactionTextField(
                          validator: descriptionValidator,
                          controller: descriptionController,
                          title: 'Description'),
                      // BlankSpace(
                      //   height: 10,
                      // )
                    ],
                  ),
                ),
                const BlankSpace(
                  height: 30,
                ),
                // AmountDetails(amountController: amountController),
                // const BlankSpace(
                //   height: 30,
                // ),
                CategorytypeField(
                    categoryController: categoryController, tr: tr),
                const BlankSpace(
                  height: 30,
                ),
                SignupButton(
                  title: 'Update Transaction',
                  onTap: () {
                    updateTransaction();
                    log(tr.id);
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
