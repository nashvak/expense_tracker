import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/decoration.dart';
import 'package:expense_tracker/models/transaction_model/transaction_model.dart';
import 'package:flutter/material.dart';

class CategorytypeField extends StatelessWidget {
  const CategorytypeField({
    super.key,
    required this.tr,
  });

  final Transaction tr;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: cardDecoration(color: Appcolor.white),
      height: MediaQuery.of(context).size.height / 11,
      width: MediaQuery.of(context).size.width / 1,
      padding: const EdgeInsets.only(top: 10, left: 20, bottom: 20, right: 20),
      //color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Catagory type',
            style: TextStyle(color: Appcolor.primaryColor),
          ),
          GestureDetector(onTap: () {}, child: Text(tr.catagoryType)),
        ],
      ),
    );
  }
}
