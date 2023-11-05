import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/sizedbox.dart';
import 'package:expense_tracker/constatnts/custom_widgets/home_screen/button.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/textstyle.dart';
import 'package:expense_tracker/controller/transaction_controller.dart';

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
        actions: [
          GestureDetector(
            onTap: () {
              Get.toNamed('/addtransaction');
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.add,
                color: Colors.black,
                size: 40,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SortButton(
                  ontap: () {
                    Get.bottomSheet(
                      Container(
                        // decoration:  ShapeDecoration(
                        color: Colors.white,
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.only(
                        //       topLeft: Radius.circular(25),
                        //       topRight: Radius.circular(25)),
                        // ),
                        // ),

                        child: Wrap(
                          children: [
                            const ListTile(
                              title: Text(
                                'Sort By',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            const Divider(color: Colors.grey, height: 5),
                            SortingBottomSheet(
                                ontap: () {
                                  transactionController.changeOption('All');
                                  Get.back();
                                },
                                title: 'All'),
                            SortingBottomSheet(
                                ontap: () {
                                  transactionController.changeOption('Income');
                                  Get.back();
                                },
                                title: 'Income'),
                            SortingBottomSheet(
                                ontap: () {
                                  transactionController.changeOption('Expense');
                                  Get.back();
                                },
                                title: 'Expense'),
                            SortingBottomSheet(
                                ontap: () {
                                  transactionController.changeOption('Cash');
                                  Get.back();
                                },
                                title: 'Cash'),
                            SortingBottomSheet(
                                ontap: () {
                                  transactionController.changeOption('Bank');
                                  Get.back();
                                },
                                title: 'Bank'),
                          ],
                        ),
                      ),
                    );
                  },
                  title: "Filter By",
                  icon: const Icon(Icons.sort),
                ),
                const BlankSpace(
                  width: 20,
                ),
                SortButton(
                    ontap: () {
                      List currentCatagory =
                          transactionController.isCatagoryIncluded();

                      Get.bottomSheet(
                        Container(
                          color: Colors.white,
                          // child: Wrap(
                          //   children: [
                          //     const ListTile(
                          //       title: Text(
                          //         'Catagory',
                          //         style: TextStyle(fontSize: 20),
                          //       ),
                          //     ),
                          //     const Divider(color: Colors.grey, height: 5),
                          // SortingBottomSheet(
                          //     ontap: () {},
                          //     title:
                          //         transactionController.catagoryTitles[0]),
                          // SortingBottomSheet(
                          //     ontap: () {},
                          //     title:
                          //         transactionController.catagoryTitles[1]),
                          // SortingBottomSheet(
                          //     ontap: () {},
                          //     title:
                          //         transactionController.catagoryTitles[2]),
                          // SortingBottomSheet(
                          //     ontap: () {},
                          //     title:
                          //         transactionController.catagoryTitles[3]),
                          // SortingBottomSheet(
                          //     ontap: () {},
                          //     title:
                          //         transactionController.catagoryTitles[4]),
                          // SortingBottomSheet(
                          //     ontap: () {},
                          //     title:
                          //         transactionController.catagoryTitles[5]),
                          // SortingBottomSheet(
                          //     ontap: () {},
                          //     title:
                          //         transactionController.catagoryTitles[6]),

                          //   ],
                          // ),
                          child: Column(
                            children: [
                              const ListTile(
                                title: Text(
                                  'Catagory',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              const Divider(color: Colors.grey, height: 5),
                              Expanded(
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return SortingBottomSheet(
                                      ontap: () {
                                        transactionController.changeOption(
                                            currentCatagory[index]);
                                        Get.back();
                                      },
                                      title: currentCatagory[index],
                                    );
                                  },
                                  itemCount: currentCatagory.length,
                                ),
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
                            SortingBottomSheet(ontap: () {}, title: 'All'),
                            SortingBottomSheet(ontap: () {}, title: 'Income'),
                            SortingBottomSheet(ontap: () {}, title: 'Expense'),
                            SortingBottomSheet(ontap: () {}, title: 'Cash'),
                            SortingBottomSheet(ontap: () {}, title: 'Bank'),
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
            BlankSpace(
              height: 30,
            ),
            GetBuilder<TransactionController>(builder: ((controller) {
              return Text(
                transactionController.selectedOption + ' Transactions',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              );
            })),
            BlankSpace(
              height: 10,
            ),
            Expanded(
              child: GetBuilder<TransactionController>(
                builder: (controller) {
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        final tr = controller.sortByFunction[index];
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
                              type: tr.transactionType,
                              ontap: () {
                                Get.to(() => const ScreenViewTransaction(),
                                    arguments: index);
                              },
                              amount: tr.amount.toDouble(),
                              date: DateFormat('dd/MM/yyyy').format(tr.date),
                              title: tr.description),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const BlankSpace(
                          height: 10,
                        );
                      },
                      itemCount: controller.sortByFunction.length);
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

class SortingBottomSheet extends StatelessWidget {
  const SortingBottomSheet(
      {required this.ontap, required this.title, super.key});
  final Function() ontap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: ontap,
    );
  }
}
