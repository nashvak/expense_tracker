import 'package:flutter/material.dart';

import '../../constatnts/colors.dart';

class SortButton extends StatelessWidget {
  SortButton(
      {required this.title,
      required this.ontap,
      required this.icon,
      super.key});
  final String title;
  final Icon icon;
  void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            children: [
              // Icon(Icons.arrow_downward),
              icon,
              Text(title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ),
    );
  }
}

class Listtile extends StatelessWidget {
  const Listtile(
      {required this.ontap,
      required this.amount,
      required this.date,
      required this.icon,
      required this.title,
      super.key});
  final String title;
  final String date;
  final double amount;
  final Icon icon;
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        leading: Container(
            decoration: const BoxDecoration(
              color: Appcolor.primaryColor,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: icon,
            )),
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          date,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        trailing: Text(
          amount.toString(),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
