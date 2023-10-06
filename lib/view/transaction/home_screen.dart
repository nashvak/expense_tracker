import 'package:expense_tracker/custom_widgets/common/sizedbox.dart';
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
                decoration: const ShapeDecoration(
                  color: Color.fromARGB(255, 223, 223, 223),
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
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(26),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Text("All",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
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
                                    Text("Income",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500)),
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
                                    Text("Expense",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        height10,
                        Expanded(
                          child: Container(
                            //color: Colors.red,
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            // color: Colors.red,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  height20,
                                  ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 0),
                                    leading: Container(
                                        decoration: const BoxDecoration(
                                          color: Appcolor.primaryColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Icon(Icons.phone_android),
                                        )),
                                    title: const Text(
                                      "Mobile Recharge",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    subtitle: const Text(
                                      '6/12/23 9:30 am',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    trailing: const Text(
                                      "₹ 500",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 0),
                                    leading: Container(
                                        decoration: const BoxDecoration(
                                          color: Appcolor.primaryColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Icon(Icons.phone_android),
                                        )),
                                    title: const Text("Mobile Recharge",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                    subtitle: const Text('6/12/23 9:30 am',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400)),
                                    trailing: const Text("₹ 500",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 0),
                                    leading: Container(
                                        decoration: const BoxDecoration(
                                          color: Appcolor.primaryColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Icon(Icons.phone_android),
                                        )),
                                    title: const Text("Mobile Recharge",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                    subtitle: const Text('6/12/23 9:30 am',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400)),
                                    trailing: const Text("₹ 500",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 0),
                                    leading: Container(
                                        decoration: const BoxDecoration(
                                          color: Appcolor.primaryColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Icon(Icons.phone_android),
                                        )),
                                    title: const Text("Mobile Recharge",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                    subtitle: const Text('6/12/23 9:30 am',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400)),
                                    trailing: const Text("₹ 500",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 0),
                                    leading: Container(
                                        decoration: const BoxDecoration(
                                          color: Appcolor.primaryColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Icon(Icons.phone_android),
                                        )),
                                    title: const Text("Mobile Recharge",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                    subtitle: const Text('6/12/23 9:30 am',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400)),
                                    trailing: const Text("₹ 500",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 0),
                                    leading: Container(
                                        decoration: const BoxDecoration(
                                          color: Appcolor.primaryColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Icon(Icons.phone_android),
                                        )),
                                    title: const Text("Mobile Recharge",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                    subtitle: const Text('6/12/23 9:30 am',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400)),
                                    trailing: const Text("₹ 500",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
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
                decoration: ShapeDecoration(
                  color: const Color.fromARGB(255, 92, 209, 230),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                ),
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
