import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constatnts/custom_widgets/common/button.dart';
import '../../constatnts/custom_widgets/common/sizedbox.dart';
import '../../constatnts/custom_widgets/login&signup/textfield.dart';

class ScreenEditRemainder extends StatelessWidget {
  ScreenEditRemainder({super.key});
  final formkey = GlobalKey<FormState>();
  final amountController = TextEditingController();
  final dateController = TextEditingController();
  final titleController = TextEditingController();
  final timeController = TextEditingController();
  final catagoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Remainder',
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
              controller: titleController,
              validator: (value) {
                return null;
              },
            ),
            height30,
            CustomTextField(
              obscure: false,
              title: 'Date',
              controller: dateController,
              validator: (value) {
                return null;
              },
            ),
            height30,
            CustomTextField(
              obscure: false,
              title: 'Time',
              controller: timeController,
              validator: (value) {
                return null;
              },
            ),
            height30,
            CustomTextField(
              obscure: false,
              title: 'Amount',
              controller: amountController,
              validator: (value) {
                return null;
              },
            ),
            height30,
            CustomTextField(
              obscure: false,
              title: 'Catagory',
              controller: catagoryController,
              validator: (value) {
                return null;
              },
            ),
            height50,
            CustomButton(
                title: 'Edit Remainder',
                onTap: () {
                  Get.toNamed('/remainder');
                })
          ],
        ),
      )),
    );
  }
}
