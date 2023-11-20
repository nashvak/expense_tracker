import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/decoration.dart';
import 'package:expense_tracker/controller/transaction_contollers/update_ui_controller.dart';
import 'package:expense_tracker/models/transaction_model/transaction_model.dart';
import 'package:expense_tracker/view/transaction/screens/history_screen/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategorytypeField extends StatelessWidget {
  final TextEditingController categoryController;

  CategorytypeField({
    super.key,
    required this.tr,
    required this.categoryController,
  });

  final Transaction tr;
  final List<String> a = ['apple', 'orange'];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: cardDecoration(color: Appcolor.white),
      height: MediaQuery.of(context).size.height / 6,
      width: MediaQuery.of(context).size.width / 1,
      padding: const EdgeInsets.only(top: 10, left: 20, bottom: 20, right: 20),
      //color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Catagory type',
            style: TextStyle(color: Appcolor.primaryColor),
          ),
          TextFormField(
            controller: categoryController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter category";
              }
              return null;
            },
            readOnly: true,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
            ),
            onTap: () async {
              Get.bottomSheet(
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      const ListTile(
                        title: Text(
                          'Select Category',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      const Divider(color: Colors.grey, height: 5),
                      Expanded(
                        child: GetBuilder<UpdateController>(
                          builder: (controller) {
                            List<String> categoryItems =
                                controller.displayCategory();
                            return ListView.builder(
                              itemBuilder: (context, index) {
                                return SortingBottomSheet(
                                  ontap: () {
                                    categoryController.text =
                                        categoryItems[index];
                                    Get.back();
                                  },
                                  title: categoryItems[index],
                                );
                              },
                              itemCount: categoryItems.length,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
