import 'package:expense_tracker/constatnts/custom_widgets/common/button.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/sizedbox.dart';
import 'package:expense_tracker/constatnts/custom_widgets/login&signup/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenAddRemainder extends StatelessWidget {
  ScreenAddRemainder({super.key});
  final formkey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final amountController = TextEditingController();
  final catagoryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add remainder',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        leadingWidth: 100,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            height30,
            CustomTextField(
              obscure: false,
              title: 'Title',
              validator: (value) {
                return null;
              },
              controller: titleController,
            ),
            height30,
            CustomTextField(
              obscure: false,
              title: 'Date',
              validator: (value) {
                return null;
              },
              controller: dateController,
            ),
            height30,
            CustomTextField(
              obscure: false,
              title: 'Time',
              validator: (value) {
                return null;
              },
              controller: timeController,
            ),
            height30,
            CustomTextField(
              obscure: false,
              title: 'Amount',
              validator: (value) {
                return null;
              },
              controller: amountController,
            ),
            height30,
            CustomTextField(
              obscure: false,
              title: 'Catagory',
              validator: (value) {
                return null;
              },
              controller: catagoryController,
            ),
            height50,
            CustomButton(
                title: 'Add Remainder',
                onTap: () {
                  Get.toNamed('/remainder');
                })
          ],
        ),
      )),
    );
  }
}
