import 'package:expense_tracker/custom_widgets/common/sizedbox.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constatnts/colors.dart';

class ScreenRemainder extends StatelessWidget {
  ScreenRemainder({super.key});

  final List<String> titles = ['car insurance', 'bike service'];
  final List<String> date = ['12/10/23', '20/10/23'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Remainder ',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/addremainder');
                  },
                  child: Icon(
                    Icons.add,
                    size: 35,
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    leading: Container(
                        decoration: const BoxDecoration(
                          color: Appcolor.primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.list,
                            size: 30,
                            color: Appcolor.white,
                          ),
                        )),
                    title: Text(
                      titles[index],
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    subtitle: Text(date[index]),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: Colors.black,
                    ),
                  );
                },
                itemCount: titles.length,
                separatorBuilder: (context, index) => height10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
