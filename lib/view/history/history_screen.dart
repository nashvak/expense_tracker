import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/sizedbox.dart';
import 'package:expense_tracker/constatnts/custom_widgets/home_screen/button.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/textstyle.dart';
import 'package:expense_tracker/controller/transaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                        if (controller.transactionCount > 0) {
                          // Transaction trans =
                          //     controller.transactionBox.getAt(index);
                          // return Listtile(
                          //     ontap: () {
                          //       Get.toNamed('/viewtransaction');
                          //     },
                          //     amount: trans.amount.toDouble(),
                          //     date: trans.date.toString(),
                          //     icon: const Icon(Icons.car_crash),
                          //     title: trans.description);
                          return const ListTile(
                              //   title: Text(trans.description),
                              );
                        } else {
                          return const Center(
                            child: Text('List is empty'),
                          );
                        }
                      },
                      separatorBuilder: (context, index) {
                        return const BlankSpace(
                          height: 10,
                        );
                      },
                      itemCount: controller.transactionCount);
                },
              ),
              // child: StreamBuilder(
              //   stream: TransRepository.getBox().watch(),
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return CircularProgressIndicator();
              //     } else if (snapshot.hasError) {
              //       return Text('Error: ${snapshot.error}');
              //     } else {
              //       var users = userBox.values.toList();
              //       return ListView.builder(
              //         itemCount: users.length,
              //         itemBuilder: (context, index) {
              //           var user = users[index];
              //           return ListTile(
              //             title: Text(user.name),
              //             subtitle: Text('Age: ${user.age}'),
              //           );
              //         },
              //       );
              //     }
              //   },
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
