import 'package:expense_tracker/constatnts/custom_widgets/common/sizedbox.dart';
import 'package:expense_tracker/models/transaction_model/transaction_model.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_formatter/money_formatter.dart';

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
              Text(
                title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const BlankSpace(
                width: 5,
              ),
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
  final TransactionType type;

  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    MoneyFormatter fmf = MoneyFormatter(amount: amount);
    return GestureDetector(
      onTap: ontap,
      child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          leading: Container(
              decoration: const BoxDecoration(
                color: Appcolor.white,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: type == TransactionType.income
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
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          subtitle: Text(
            date,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          trailing: Text(
              type == TransactionType.expense
                  ? "- ${fmf.output.compactNonSymbol}"
                  : "+ ${fmf.output.compactNonSymbol}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
                color:
                    type == TransactionType.expense ? Colors.red : Colors.green,
              ))),
    );
  }
}
