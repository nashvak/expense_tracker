import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/custom_widgets/common/sizedbox.dart';
import 'package:expense_tracker/custom_widgets/home_screen/home_screen_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../custom_widgets/common/decoration.dart';

class ScreenHistory extends StatelessWidget {
  const ScreenHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.tertiaryColor,
      appBar: AppBar(
        title: const Text(
          'History',
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
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
                  title: "All",
                  icon: Icon(Icons.arrow_drop_down),
                ),
                BlankSpace(
                  width: 20,
                ),
                SortButton(
                    title: 'Catagory', icon: Icon(Icons.arrow_drop_down)),
                BlankSpace(
                  width: 20,
                ),
                SortButton(title: 'Date', icon: Icon(Icons.arrow_drop_down))
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
                          icon: Icon(Icons.car_crash),
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
