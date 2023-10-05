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
              right: 0,
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: ShapeDecoration(
                  color: const Color.fromARGB(255, 223, 223, 223),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 150, left: 30, right: 30, bottom: 0),
                  child: Container(
                    color: Colors.green,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Recent Transaction"),
                        height10,
                        Row(
                          children: [
                            Container(
                              height: 35,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(26)),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
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
                                  borderRadius: BorderRadius.circular(26),
                                ),
                              ),
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
                                  borderRadius: BorderRadius.circular(26),
                                ),
                              ),
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
                        height10,
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.red,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Card(
                                    child: ListTile(
                                      title: Text("jvf"),
                                    ),
                                  ),
                                  height20,
                                  Card(
                                    child: ListTile(
                                      title: Text("jvf"),
                                    ),
                                  ),
                                  height20,
                                  Card(
                                    child: ListTile(
                                      title: Text("jvf"),
                                    ),
                                  ),
                                  height20,
                                  Card(
                                    child: ListTile(
                                      title: Text("jvf"),
                                    ),
                                  ),
                                  height20,
                                  Card(
                                    child: ListTile(
                                      title: Text("jvf"),
                                    ),
                                  ),
                                  height20,
                                  Card(
                                    child: ListTile(
                                      title: Text("jvf"),
                                    ),
                                  ),
                                  height20,
                                  Card(
                                    child: ListTile(
                                      title: Text("jvf"),
                                    ),
                                  ),
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
