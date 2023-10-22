import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/button.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/decoration.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/sizedbox.dart';
import 'package:expense_tracker/controller/transaction_controller.dart';
import 'package:expense_tracker/models/transaction_model/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenViewTransaction extends StatelessWidget {
  ScreenViewTransaction({super.key});
  final int index = Get.arguments;
  final TransactionController transactionController =
      Get.put(TransactionController());
  @override
  Widget build(BuildContext context) {
    Transaction tr = transactionController.transactionBox.getAt(index);
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
                onPressed: () {},
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
                    TextFormField(
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: 'Expense'),
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
                      'Catagory',
                      style: TextStyle(color: Appcolor.primaryColor),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                decoration: InputDecoration.collapsed(
                                  border: InputBorder.none,
                                  hintText: tr.description,
                                  hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              TextFormField(
                                decoration: InputDecoration.collapsed(
                                    border: InputBorder.none,
                                    hintText: tr.date.toString(),
                                    hintStyle: TextStyle(fontSize: 14)),
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
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: tr.amount.toString()),
                    ),
                  ],
                ),
              ),
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
    );
  }
}
