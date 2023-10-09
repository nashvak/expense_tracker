import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/custom_widgets/common/sizedbox.dart';
import 'package:expense_tracker/custom_widgets/common/home_screen_widgets.dart';
import 'package:expense_tracker/custom_widgets/common/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenHistory extends StatelessWidget {
  const ScreenHistory({super.key});

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
                BlankSpace(
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
                BlankSpace(
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
                    icon: const Icon(Icons.arrow_drop_down))
              ],
            ),
            height40,
            Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Listtile(
                          ontap: () {
                            Get.toNamed('/viewtransaction');
                          },
                          amount: 200,
                          date: '12/3/23',
                          icon: const Icon(Icons.car_crash),
                          title: 'Car service');
                    },
                    separatorBuilder: (context, index) {
                      return BlankSpace(
                        height: 10,
                      );
                    },
                    itemCount: 3))
          ],
        ),
      ),
    );
  }
}
