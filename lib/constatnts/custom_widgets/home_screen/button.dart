import 'package:expense_tracker/models/transaction_model/transaction_model.dart';
import 'package:flutter/material.dart';

import '../../colors.dart';

class SortButton extends StatelessWidget {
  const SortButton(
      {required this.title,
      required this.ontap,
      required this.icon,
      super.key});
  final String title;
  final Icon icon;
  final void Function() ontap;
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
              Text(title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500)),
              icon,
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
      required this.title,
      required this.type,
      super.key});
  final String title;
  final String date;
  final double amount;
  final CatagoryType type;

  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        leading: Container(
            decoration: const BoxDecoration(
              color: Appcolor.white,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: type == CatagoryType.income
                  ? const Icon(
                      Icons.arrow_upward,
                      color: Colors.green,
                    )
                  : const Icon(
                      Icons.arrow_downward,
                      color: Colors.red,
                    ),
            )),
        // leading: CircleAvatar(
        //   backgroundColor: Appcolor.primaryColor,
        //   child: icon,
        // ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          date,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        trailing: Text(
          type == CatagoryType.expense ? "- $amount" : "+ $amount",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: type == CatagoryType.expense ? Colors.red : Colors.green),
        ),
      ),
    );
  }
}
