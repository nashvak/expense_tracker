import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/button.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/sizedbox.dart';
import 'package:expense_tracker/controller/transaction_contollers/transaction_ui_controller.dart';
import 'package:expense_tracker/view/transaction/screens/edit_category.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCategory extends StatelessWidget {
  AddCategory({super.key});
  final TextEditingController categoryController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final UiController uiController = Get.put(UiController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolor.primaryColor,
        title: Text('Add Category'),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => EditCategory());
              },
              icon: Icon(Icons.edit))
        ],
      ),
      body: 
    );
  }
}
