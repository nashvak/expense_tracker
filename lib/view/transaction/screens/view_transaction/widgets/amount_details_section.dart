import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/decoration.dart';
import 'package:flutter/material.dart';

class AmountDetails extends StatelessWidget {
  const AmountDetails({
    super.key,
    required this.amountController,
  });

  final TextEditingController amountController;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            controller: amountController,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }
}