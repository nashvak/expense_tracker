import 'package:expense_tracker/custom_widgets/common/button.dart';
import 'package:expense_tracker/custom_widgets/common/sizedbox.dart';
import 'package:expense_tracker/custom_widgets/loginPage/login_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenAddRemainder extends StatelessWidget {
  const ScreenAddRemainder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add remainder',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        leadingWidth: 100,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            height30,
            CustomTextField(title: 'Title'),
            height30,
            CustomTextField(title: 'Date'),
            height30,
            CustomTextField(title: 'Time'),
            height30,
            CustomTextField(title: 'Amount'),
            height30,
            CustomTextField(title: 'Catagory'),
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
