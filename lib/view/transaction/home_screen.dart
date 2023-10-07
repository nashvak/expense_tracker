import 'package:expense_tracker/custom_widgets/common/sizedbox.dart';
import 'package:expense_tracker/view/transaction/view_transaction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constatnts/colors.dart';
import '../../custom_widgets/common/decoration.dart';
import '../../custom_widgets/home_screen/home_screen_widgets.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.primaryColor,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            const Positioned(
              top: 50,
              left: 30,
              // height: 200,
              // width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello,',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  Text(
                    'Nashva',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
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
                  child: Container(
                    //color: Colors.green,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Recent Transaction",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        height20,
                        Row(
                          children: [
                            Container(
                              //height: 35,
                              decoration: cardDecoration(color: Appcolor.white),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Text(
                                  "All",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            BlankSpace(
                              width: 10,
                            ),
                            const SortButton(
                                title: 'Income',
                                icon: Icon(Icons.arrow_upward)),
                            const SizedBox(
                              width: 10,
                            ),
                            const SortButton(
                                title: 'Expense',
                                icon: Icon(Icons.arrow_downward))
                          ],
                        ),
                        height10,
                        Expanded(
                          child: Container(
                            //color: Colors.red,
                            //height: MediaQuery.of(context).size.height,
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            // color: Colors.red,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  height20,
                                  Listtile(
                                      ontap: () {
                                        Get.to(
                                          () => const ScreenViewTransaction(),
                                          fullscreenDialog: true,
                                          // duration: Duration(milliseconds: 500),
                                          transition: Transition.downToUp,
                                        );
                                      },
                                      amount: 250,
                                      date: '1/10/23 6:30pm',
                                      icon: Icon(Icons.phone_android),
                                      title: 'Electricity bill'),
                                  Listtile(
                                      ontap: () {},
                                      amount: 499,
                                      date: '21/09/23 2:30pm',
                                      icon: Icon(Icons.phone_android),
                                      title: 'Mobile recharge'),
                                  Listtile(
                                      ontap: () {},
                                      amount: 6000,
                                      date: '11/09/23 10:00am',
                                      icon: Icon(Icons.phone_android),
                                      title: 'Car EMI'),
                                  Listtile(
                                      ontap: () {},
                                      amount: 250,
                                      date: '1/10/23 6:30pm',
                                      icon: Icon(Icons.phone_android),
                                      title: 'Electricity bill'),
                                  Listtile(
                                      ontap: () {},
                                      amount: 499,
                                      date: '21/09/23 2:30pm',
                                      icon: Icon(Icons.phone_android),
                                      title: 'Mobile recharge'),
                                ],
                              ),
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
                    cardDecoration(color: Color.fromARGB(255, 92, 209, 230)),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "BALANCE",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                            height10,
                            const Align(
                              alignment: Alignment.center,
                              child: Text(
                                "₹ 10000",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.arrow_circle_up,
                                  size: 24,
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Income",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15),
                                    ),
                                    Text(
                                      "₹ 1000",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.arrow_circle_up,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    Text("Income",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15)),
                                    Text("₹ 1000",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15)),
                                  ],
                                )
                              ],
                            ),
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
