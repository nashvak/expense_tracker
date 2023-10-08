import 'package:expense_tracker/custom_widgets/common/button.dart';
import 'package:expense_tracker/custom_widgets/common/sizedbox.dart';
import 'package:expense_tracker/custom_widgets/common/login_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenAddRemainder extends StatelessWidget {
  const ScreenAddRemainder({super.key});

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
            const CustomTextField(title: 'Title'),
            height30,
            const CustomTextField(title: 'Date'),
            height30,
            const CustomTextField(title: 'Time'),
            height30,
            const CustomTextField(title: 'Amount'),
            height30,
            const CustomTextField(title: 'Catagory'),
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
