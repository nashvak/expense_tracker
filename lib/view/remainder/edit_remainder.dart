import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../custom_widgets/common/button.dart';
import '../../custom_widgets/common/sizedbox.dart';
import '../../custom_widgets/loginPage/login_widgets.dart';

class ScreenEditRemainder extends StatelessWidget {
  const ScreenEditRemainder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Remainder',
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
