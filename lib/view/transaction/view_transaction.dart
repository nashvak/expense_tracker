import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/custom_widgets/common/decoration.dart';
import 'package:expense_tracker/custom_widgets/common/sizedbox.dart';
import 'package:flutter/material.dart';

class ScreenViewTransaction extends StatelessWidget {
  const ScreenViewTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.tertiaryColor,
      appBar: AppBar(
        titleSpacing: 8,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: const Text(
          "Edit",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: TextButton(
                onPressed: () {},
                child: Text(
                  "Save",
                  style: TextStyle(color: Appcolor.primaryColor, fontSize: 17),
                )),
          )
        ],
        elevation: 0,
        backgroundColor: Appcolor.tertiaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: cardDecoration(color: Colors.white),
                height: MediaQuery.of(context).size.height / 9,
                width: MediaQuery.of(context).size.width / 1,
                padding: const EdgeInsets.only(left: 20),
                //color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Transaction type',
                      style: TextStyle(color: Appcolor.primaryColor),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: 'Expense'),
                    ),
                  ],
                ),
              ),
              height30,
              Container(
                decoration: cardDecoration(color: Colors.white),
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Catagory',
                      style: TextStyle(color: Appcolor.primaryColor),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Appcolor.primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.phone,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        BlankSpace(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: const InputDecoration.collapsed(
                                  border: InputBorder.none,
                                  hintText: 'Mobile Recharge',
                                  hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              TextFormField(
                                decoration: const InputDecoration.collapsed(
                                    border: InputBorder.none,
                                    hintText: '06/10/23',
                                    hintStyle: TextStyle(fontSize: 14)),
                              ),
                            ],
                          ),
                        )
                      ],
                    )

                    // Container(Row(
                    //   // mainAxisAlignment: MainAxisAlignment.start,
                    //   // crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     Container(
                    //         decoration: const BoxDecoration(
                    //           color: Appcolor.primaryColor,
                    //           shape: BoxShape.circle,
                    //         ),
                    //         child: const Padding(
                    //           padding: EdgeInsets.all(10),
                    //           child: Icon(
                    //             Icons.phone,
                    //             color: Colors.white,
                    //           ),
                    //         )),
                    //     BlankSpace(
                    //       width: 10,
                    //     ),
                    //     Column(
                    //       children: [
                    //         Expanded(
                    //           child: TextFormField(
                    //             decoration: const InputDecoration(
                    //                 border: InputBorder.none,
                    //                 hintText: 'Expense'),
                    //           ),
                    //         ),
                    //       ],
                    //     )
                    //   ],
                    // ))
                  ],
                ),
              ),
              BlankSpace(
                height: 30,
              ),
              Container(
                decoration: cardDecoration(color: Colors.white),
                height: MediaQuery.of(context).size.height / 9,
                width: MediaQuery.of(context).size.width / 1,
                padding: const EdgeInsets.only(left: 20),
                //color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Amount',
                      style: TextStyle(color: Appcolor.primaryColor),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          border: InputBorder.none, hintText: '500'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
