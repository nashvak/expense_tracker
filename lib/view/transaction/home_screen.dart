import 'package:expense_tracker/constatnts/custom_widgets/home_screen/button.dart';
import 'package:expense_tracker/controller/transaction_controller.dart';
import 'package:expense_tracker/models/transaction_model/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../constatnts/colors.dart';
import '../../constatnts/custom_widgets/common/decoration.dart';
import '../../constatnts/custom_widgets/home_screen/appbar.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  final TransactionController transactionController =
      Get.put(TransactionController());
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
                            child: GetBuilder<TransactionController>(
                              builder: (controller) {
                                return ListView.separated(
                                    itemBuilder: (context, index) {
                                      Transaction tr =
                                          controller.sortedList[index];

                                      return Listtile(
                                          ontap: () {},
                                          amount: tr.amount.toDouble(),
                                          date: DateFormat('dd/MM/yyyy')
                                              .format(tr.date),
                                          title: tr.description,
                                          type: tr.type);
                                    },
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(
                                        height: 20,
                                      );
                                    },
                                    itemCount: controller.transactionCount < 4
                                        ? controller.transactionCount
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
                decoration: cardDecoration(
                    color: const Color.fromARGB(255, 92, 209, 230)),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const BalanceCard(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IncomeCard(),
                            const ExpenseCard(),
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

//   B A L A N C E   C A R D

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.center,
          child: Text(
            "BALANCE",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        Align(
            alignment: Alignment.center,
            child: GetBuilder<TransactionController>(builder: (controller) {
              return Text(
                "₹ ${controller.totalBalance}",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              );
            })),
      ],
    );
  }
}

//   I N C O M E    C A R D
class IncomeCard extends StatelessWidget {
  IncomeCard({
    super.key,
  });
  final TransactionController transactionController =
      Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: Appcolor.white,
          child: Icon(
            Icons.arrow_downward,
            color: Colors.green,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          children: [
            const Text(
              "Income",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            GetBuilder<TransactionController>(
              builder: (controller) {
                return Text(
                  "₹ ${controller.totalIncome}",
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                );
              },
            ),
          ],
        )
      ],
    );
  }
}

//    E X P E N S E    C A R D
class ExpenseCard extends StatelessWidget {
  const ExpenseCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: Appcolor.white,
          child: Icon(
            Icons.arrow_upward,
            color: Colors.red,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          children: [
            const Text("Expense",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                )),
            GetBuilder<TransactionController>(
              builder: (controller) {
                return Text(
                  "₹ ${controller.totalExpense}",
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
