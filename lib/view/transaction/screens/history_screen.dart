import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/sizedbox.dart';
import 'package:expense_tracker/constatnts/custom_widgets/home_screen/button.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/textstyle.dart';
import 'package:expense_tracker/controller/filer_controller.dart';
// import 'package:expense_tracker/controller/transaction_contollers/date_range_picker.dart';

import 'package:expense_tracker/controller/transaction_contollers/transaction_controller.dart';

import 'package:expense_tracker/view/transaction/screens/view_transaction/view_transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ScreenHistory extends StatelessWidget {
  ScreenHistory({super.key});
  final TransactionController transactionController =
      Get.put(TransactionController());
  final FilterController filterController = Get.put(FilterController());
  // final DateRangePickerController dateRangePickerController =
  //     Get.put(DateRangePickerController());

  @override
  Widget build(BuildContext context) {
    filterController.selectedOption = 'All';
    return Scaffold(
      backgroundColor: Appcolor.tertiaryColor,
      appBar: AppBar(
        title: Text(
          'History',
          style: screenTitleText(),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SortButton(
                  ontap: () {
                    List filterList = filterController.isFilterIncluded();
                    Get.bottomSheet(
                      Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            const ListTile(
                              title: Text(
                                'Sort By',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            const Divider(color: Colors.grey, height: 5),
                            Expanded(
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return SortingBottomSheet(
                                    ontap: () {
                                      filterController
                                          .changeOption(filterList[index]);
                                      Get.back();
                                    },
                                    title: filterList[index],
                                  );
                                },
                                itemCount: filterList.length,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  title: "Filter By",
                  icon: const Icon(Icons.sort),
                ),
                SortButton(
                  ontap: () {
                    List currentCatagory =
                        filterController.isCatagoryIncluded();

                    Get.bottomSheet(
                      Container(
                        color: Colors.white,
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
                                      filterController
                                          .changeOption(currentCatagory[index]);
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
                  icon: const Icon(Icons.arrow_drop_down),
                ),
                GetBuilder<FilterController>(
                  builder: (controller) {
                    return SortButton(
                      ontap: () {
                        controller.selectDateRange();
                      },
                      title: 'Date',
                      icon: const Icon(Icons.arrow_drop_down),
                    );
                  },
                ),
              ],
            ),
            const BlankSpace(
              height: 30,
            ),
            GetBuilder<FilterController>(builder: ((controller) {
              return Text(
                filterController.selectedOption,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              );
            })),
            const BlankSpace(
              height: 10,
            ),
            Expanded(
              child: GetBuilder<FilterController>(
                builder: (controller) {
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        final tr = controller.sortByFunction[index];
                        print(tr.id);

                        return Slidable(
                          key: UniqueKey(),
                          endActionPane: ActionPane(
                              dismissible: DismissiblePane(
                                onDismissed: () {
                                  transactionController.deleteTransaction(
                                      id: tr.id);
                                },
                              ),
                              motion: const DrawerMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    transactionController.deleteTransaction(
                                        id: tr.id);
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
                                    arguments: tr.id);
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
