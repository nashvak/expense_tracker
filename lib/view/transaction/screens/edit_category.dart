import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/sizedbox.dart';
import 'package:expense_tracker/controller/transaction_contollers/transaction_ui_controller.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/button.dart';
import 'package:get/get.dart';

class EditCategory extends StatelessWidget {
  EditCategory({super.key});
  final TextEditingController categoryController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final UiController uiController = Get.put(UiController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit category'),
        elevation: 0,
        backgroundColor: Appcolor.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: categoryController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Add any category';
                    }
                    return null;
                  },
                ),
                BlankSpace(
                  height: 30,
                ),
                SignupButton(
                    title: 'Add Category',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        uiController.addCategory(categoryController.text);
                      }
                      Get.back();
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
