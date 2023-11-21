import 'package:expense_tracker/constatnts/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomsheetAppbar extends StatelessWidget {
  const BottomsheetAppbar({required this.title, super.key});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        CircleAvatar(
          backgroundColor: Appcolor.white,
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.close),
          ),
        ),
      ],
    );
  }
}
