import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/button.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/sizedbox.dart';
import 'package:expense_tracker/controller/transaction_contollers/transaction_ui_controller.dart';
import 'package:expense_tracker/models/transaction_model/transaction_model.dart';
import 'package:expense_tracker/view/transaction/screens/add_transaction/widgets/edit_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCategory extends StatelessWidget {
  AddCategory({super.key});
  final TextEditingController categoryController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final UiController uiController = Get.put(
    UiController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Appcolor.white),
        backgroundColor: Appcolor.primaryColor,
        title: const Text(
          'Add Category',
          style: TextStyle(color: Appcolor.white),
        ),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(
                  () => const EditCategory(),
                );
              },
              icon: const Icon(Icons.edit))
        ],
      ),
      body: Column(
        children: [
          Padding(
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
                      title: 'Add Category',
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          uiController.addCategory(categoryController.text);
                          categoryController.clear();
                        }
                      }),
                  const BlankSpace(
                    height: 50,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      uiController.selectedTransactionType ==
                              TransactionType.income
                          ? 'Income'
                          : 'Expense',
                      style: const TextStyle(
                          fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: SizedBox(
            // color: Colors.red,
            width: double.infinity,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
              child: GetBuilder<UiController>(
                builder: (controller) {
                  List<String> categoryItems =
                      controller.showCategoryDropdown();
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          Get.to(
                            () => const EditCategory(),
                            arguments: index,
                          );
                        },
                        horizontalTitleGap: 0,
                        contentPadding: const EdgeInsets.all(0),
                        title: Text(
                          categoryItems[index],
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            controller.deleteCategory(index);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      );
                    },
                    itemCount: categoryItems.length,
                  );
                },
              ),
            ),
          ))
        ],
      ),
    );
  }
}
