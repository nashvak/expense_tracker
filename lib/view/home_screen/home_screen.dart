import 'package:expense_tracker/constatnts/custom_widgets/home_screen/button.dart';
import 'package:expense_tracker/controller/filer_controller.dart';
import 'package:expense_tracker/controller/transaction_contollers/transaction_controller.dart';
import 'package:expense_tracker/models/transaction_model/transaction_model.dart';
import 'package:expense_tracker/view/home_screen/widgets/balance_card.dart';
import 'package:expense_tracker/view/home_screen/widgets/expense_card.dart';
import 'package:expense_tracker/view/home_screen/widgets/income_card.dart';
import 'package:expense_tracker/view/transaction/screens/view_transaction/view_transaction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../constatnts/colors.dart';
import '../../constatnts/custom_widgets/common/decoration.dart';
import 'widgets/appbar.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  final TransactionController transactionController =
      Get.put(TransactionController());
  final FilterController filterController = Get.put(FilterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.primaryColor,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            const Positioned(
              top: 50,
              left: 30,
              right: 30,
              // height: 200,
              // width: double.infinity,
              child: HomescreenAppbar(),
            ),
            Positioned(
              top: 250,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration:
                    backgroundCurveDecoration(color: Appcolor.tertiaryColor),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 120, left: 30, right: 30, bottom: 0),
                  child: SizedBox(
                    //color: Colors.green,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Recent Transaction",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: GetBuilder<FilterController>(
                              builder: (controller) {
                                return ListView.separated(
                                    itemBuilder: (context, index) {
                                      Transaction tr = transactionController
                                          .sortedList[index];

                                      return GestureDetector(
                                        onLongPress: () async {
                                          await controller.deleteDialog(tr.id);
                                        },
                                        child: Listtile(
                                            ontap: () {
                                              Get.to(
                                                  () =>
                                                      const ScreenViewTransaction(),
                                                  arguments: tr.id);
                                            },
                                            amount: tr.amount.toDouble(),
                                            date: DateFormat('dd/MM/yyyy')
                                                .format(tr.date),
                                            title: tr.description,
                                            type: tr.transactionType),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(
                                        height: 20,
                                      );
                                    },
                                    itemCount: transactionController
                                                .transactionCount <
                                            4
                                        ? transactionController.transactionCount
                                        : 4);
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  //
                ),
              ),
            ),
            Positioned(
              top: 150,
              left: 30,
              right: 30,
              height: 200,
              //width: MediaQuery.of(context).size.width,
              child: Container(
                decoration:
                    cardDecoration(color: Color.fromARGB(255, 3, 3, 94)),
                // color: const Color.fromARGB(255, 6, 14, 109)),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        BalanceCard(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IncomeCard(),
                            ExpenseCard(),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
