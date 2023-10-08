import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../custom_widgets/common/button.dart';
import '../../custom_widgets/common/sizedbox.dart';
import '../../custom_widgets/common/login_widgets.dart';

class ScreenEditRemainder extends StatelessWidget {
  const ScreenEditRemainder({super.key});

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
