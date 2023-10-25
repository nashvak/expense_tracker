import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/button.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/decoration.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/sizedbox.dart';
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
  final updateFormkey = GlobalKey<FormState>();

  TextEditingController amountController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime? pickedDate;
  late PaymentMode selectedPaymentMode;
  late CatagoryType selectedCatagory;

  @override
  void initState() {
    Transaction tr = transactionController.sortedList[index];
    amountController = TextEditingController(text: tr.amount.toString());
    descriptionController = TextEditingController(text: tr.description);
    dateController =
        TextEditingController(text: DateFormat('dd/MM/yyyy').format(tr.date));
    selectedCatagory = tr.type;
    selectedPaymentMode = tr.mode;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Transaction tr = transactionController.sortedList[index];
    //print(tr.description);

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
            child: TextButton(
                onPressed: () {
                  // print('dsads');
                  if (updateFormkey.currentState!.validate()) {
                    // print(pickedDate);
                    Transaction transaction = Transaction(
                        description: descriptionController.text,
                        amount: int.parse(amountController.text),
                        date: pickedDate!,
                        mode: selectedPaymentMode,
                        type: selectedCatagory);
                    transactionController.updateTransaction(
                        index: index, transaction: transaction);
                    // print('updated');
                    Get.back();
                  }
                },
                child: const Text(
                  "Save",
                  style: TextStyle(color: Appcolor.primaryColor, fontSize: 17),
                )),
          )
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
                      DropdownButton<PaymentMode>(
                          onChanged: (PaymentMode? newValue) {
                            setState(() {
                              selectedPaymentMode = newValue!;
                            });
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
                          value: selectedPaymentMode),
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
                        'Catagory',
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
                                    // hintStyle: TextStyle(
                                    //     fontSize: 18,
                                    //     color: Colors.black,
                                    //     fontWeight: FontWeight.w500),
                                  ),
                                ),
                                TextFormField(
                                  controller: dateController,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  onTap: () async {
                                    pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2023),
                                        lastDate: DateTime(2024));

                                    if (pickedDate != null) {
                                      setState(() {});
                                      dateController.text =
                                          DateFormat('dd/MM/yyyy')
                                              .format(pickedDate!);
                                    }
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
                DropdownButton<CatagoryType>(
                    onChanged: (CatagoryType? newValue) {
                      setState(() {
                        selectedCatagory = newValue!;
                      });
                    },
                    items: CatagoryType.values.map((CatagoryType type) {
                      return DropdownMenuItem<CatagoryType>(
                        value: type,
                        child: Text(type
                            .toString()
                            .split('.')
                            .last), // To display the enum value as a string
                      );
                    }).toList(),
                    value: selectedCatagory),
                const BlankSpace(
                  height: 30,
                ),
                CustomButton(
                    title: 'Delete Transaction',
                    onTap: () {
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
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
