import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/sizedbox.dart';
import 'package:expense_tracker/constatnts/custom_widgets/home_screen/button.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/textstyle.dart';
import 'package:expense_tracker/controller/transaction_controller.dart';
import 'package:expense_tracker/models/transaction_model/transaction_model.dart';
import 'package:expense_tracker/view/transaction/view_transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ScreenHistory extends StatelessWidget {
  ScreenHistory({super.key});
  final TransactionController transactionController =
      Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.tertiaryColor,
      appBar: AppBar(
        title: Text(
          'History',
          style: screenTitleText(),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Column(
          children: [
            Row(
              children: [
                SortButton(
                  ontap: () {
                    Get.bottomSheet(
                      Container(
                        decoration: const ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25)),
                          ),
                        ),
                        child: Wrap(
                          children: [
                            ListTile(
                              title: const Text('All'),
                              onTap: () {
                                Get.back();
                              },
                            ),
                            ListTile(
                              title: const Text('Income'),
                              onTap: () {
                                Get.back();
                              },
                            ),
                            ListTile(
                              title: const Text('Expense'),
                              onTap: () {
                                Get.back();
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  title: "All",
                  icon: const Icon(Icons.arrow_drop_down),
                ),
                const BlankSpace(
                  width: 20,
                ),
                SortButton(
                    ontap: () {
                      Get.bottomSheet(
                        Container(
                          decoration: const ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25)),
                            ),
                          ),
                          child: Wrap(
                            children: [
                              ListTile(
                                title: const Text('Electricity bill'),
                                onTap: () {
                                  Get.back();
                                },
                              ),
                              ListTile(
                                title: const Text('Car service'),
                                onTap: () {
                                  Get.back();
                                },
                              ),
                              ListTile(
                                title: const Text('Mobile Recharge'),
                                onTap: () {
                                  Get.back();
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    title: 'Catagory',
                    icon: const Icon(Icons.arrow_drop_down)),
                const BlankSpace(
                  width: 20,
                ),
                SortButton(
                  ontap: () {
                    Get.bottomSheet(
                      Container(
                        decoration: const ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25)),
                          ),
                        ),
                        child: Wrap(
                          children: [
                            ListTile(
                              title: const Text('All'),
                              onTap: () {
                                Get.back();
                              },
                            ),
                            ListTile(
                              title: const Text('Income'),
                              onTap: () {
                                Get.back();
                              },
                            ),
                            ListTile(
                              title: const Text('Expense'),
                              onTap: () {
                                Get.back();
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  title: 'Date',
                  icon: const Icon(Icons.arrow_drop_down),
                ),
              ],
            ),
            height40,
            Expanded(
              child: GetBuilder<TransactionController>(
                builder: (controller) {
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        Transaction tr = controller.transactionBox.getAt(index);
                        return Slidable(
                          key: UniqueKey(),
                          endActionPane: ActionPane(
                              dismissible: DismissiblePane(
                                onDismissed: () {
                                  controller.deleteTransaction(index: index);
                                },
                              ),
                              motion: const DrawerMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    controller.deleteTransaction(index: index);
                                  },
                                  backgroundColor: const Color(0xFFFE4A49),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  //label: 'Delete',
                                ),
                              ]),
                          child: Listtile(
                              type: tr.type,
                              ontap: () {
                                Get.to(() => ScreenViewTransaction(),
                                    arguments: index);
                              },
                              amount: tr.amount.toDouble(),
                              date: DateFormat('yyyy-MM-dd').format(tr.date),
                              title: tr.description),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const BlankSpace(
                          height: 10,
                        );
                      },
                      itemCount: controller.transactionCount);
                },
              ),
              //
            ),
          ],
        ),
      ),
    );
  }
}
