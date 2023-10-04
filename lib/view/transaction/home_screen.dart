import 'package:expense_tracker/custom_widgets/sizedbox.dart';
import 'package:flutter/material.dart';

import '../../constatnts/colors.dart';

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
                  Text('Nashva',
                      style: TextStyle(fontSize: 35, color: Colors.white)),
                ],
              ),
            ),
            Positioned(
              top: 250,
              left: 0,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Container(
                decoration: ShapeDecoration(
                  color: const Color.fromARGB(255, 223, 223, 223),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 130,
                      left: 30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Recent Transaction"),
                          height10,
                          Row(
                            children: [
                              Container(
                                decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(26))),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Text("All"),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(26))),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Row(
                                    children: [
                                      Icon(Icons.arrow_upward),
                                      Text("Income"),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(26))),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Row(
                                    children: [
                                      Icon(Icons.arrow_downward),
                                      Text("Expense"),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
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
                color: const Color.fromARGB(255, 92, 209, 230),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            const Align(
                              alignment: Alignment.center,
                              child: Text("BALANCE"),
                            ),
                            height10,
                            const Align(
                              alignment: Alignment.center,
                              child: Text("₹ 10000"),
                            ),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.arrow_circle_up),
                                Column(
                                  children: [
                                    Text("Income"),
                                    Text("₹ 1000"),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.arrow_circle_up),
                                Column(
                                  children: [
                                    Text("Income"),
                                    Text("₹ 1000"),
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
