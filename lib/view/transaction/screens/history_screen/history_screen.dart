import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/sizedbox.dart';
import 'package:expense_tracker/constatnts/custom_widgets/home_screen/button.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/textstyle.dart';
import 'package:expense_tracker/controller/filer_controller.dart';
// import 'package:expense_tracker/controller/transaction_contollers/date_range_picker.dart';

import 'package:expense_tracker/controller/transaction_contollers/transaction_controller.dart';
import 'package:expense_tracker/controller/transaction_contollers/update_ui_controller.dart';
import 'package:expense_tracker/view/transaction/screens/history_screen/bottomsheet.dart';
import 'package:expense_tracker/view/transaction/screens/history_screen/bottomsheet_listtile.dart';
import 'package:expense_tracker/view/transaction/screens/history_screen/datefilterbtn.dart';
import 'package:expense_tracker/view/transaction/screens/history_screen/filterby_listtile.dart';

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

  final UpdateController updateController = Get.put(
    UpdateController(),
  );

  filterBottomsheet(List<String> filterList) {
    Get.bottomSheet(
      backgroundColor: Appcolor.tertiaryColor,
      Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
        child: Column(
          children: [
            BottomsheetAppbar(title: 'Filter by'),
            BlankSpace(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return SortingBottomSheet(
                    ontap: () {
                      filterController.changeOption(filterList[index]);
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
  }

  categoryBottomsheet(List<String> currentCatagory) {
    Get.bottomSheet(
      backgroundColor: Appcolor.tertiaryColor,
      Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
        child: Column(
          children: [
            BottomsheetAppbar(title: 'Filter by category'),
            BlankSpace(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return SortingBottomSheet(
                    ontap: () {
                      filterController.changeOption(currentCatagory[index]);
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
  }

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
                    List<String> filterList =
                        filterController.isFilterIncluded();
                    filterBottomsheet(filterList);
                  },
                  title: "Filter By",
                  icon: const Icon(Icons.sort),
                ),
                SortButton(
                  ontap: () {
                    List<String> currentCatagory =
                        filterController.isCatagoryIncluded();
                    categoryBottomsheet(currentCatagory);
                  },
                  title: 'Catagory',
                  icon: const Icon(Icons.arrow_drop_down),
                ),
                const DateRangeFiltering(),
              ],
            ),
            const BlankSpace(
              height: 30,
            ),
            const FilteringName(),
            const BlankSpace(
              height: 10,
            ),
            Expanded(
              child: GetBuilder<FilterController>(
                builder: (controller) {
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        final tr = controller.sortByFunction[index];
                        // print(tr.id);

                        return Slidable(
                          key: UniqueKey(),
                          endActionPane: ActionPane(
                              // dismissible: DismissiblePane(
                              //   onDismissed: () async {
                              //     await controller.deleteDialog(tr.id);
                              //   },
                              // ),
                              motion: const DrawerMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) async {
                                    await controller.deleteDialog(tr.id);
                                  },
                                  backgroundColor: const Color(0xFFFE4A49),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  //label: 'Delete',
                                ),
                              ]),
                          child: GestureDetector(
                            onLongPress: () async {
                              await controller.deleteDialog(tr.id);
                            },
                            child: Listtile(
                                type: tr.transactionType,
                                ontap: () {
                                  Get.to(() => const ScreenViewTransaction(),
                                      arguments: tr.id);
                                },
                                amount: tr.amount.toDouble(),
                                date: DateFormat('dd/MM/yyyy').format(tr.date),
                                title: tr.description),
                          ),
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
