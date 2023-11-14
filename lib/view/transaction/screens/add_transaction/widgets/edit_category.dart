import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/sizedbox.dart';
import 'package:expense_tracker/controller/transaction_contollers/transaction_ui_controller.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/button.dart';
import 'package:get/get.dart';

class EditCategory extends StatefulWidget {
  const EditCategory({super.key});

  @override
  State<EditCategory> createState() => _EditCategoryState();
}

class _EditCategoryState extends State<EditCategory> {
  final TextEditingController categoryController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final UiController uiController = Get.put(UiController());
  final index = Get.arguments;

  @override
  void initState() {
    categoryController.text = uiController.showCategoryDropdown()[index];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit category'),
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
                const BlankSpace(
                  height: 30,
                ),
                SignupButton(
                    title: 'Update Category',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        uiController.updateCategory(
                            index, categoryController.text);
                        Get.back();
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
