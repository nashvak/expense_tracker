import 'package:flutter/material.dart';

import '../../constatnts/colors.dart';
import '../common/sizedbox.dart';

class BottomText extends StatelessWidget {
  const BottomText(
      {required this.title,
      required this.title2,
      required this.ontap,
      super.key});
  final String title;
  final String title2;
  final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: titleStyle()),
        GestureDetector(
          onTap: ontap,
          child: Text(
            title2,
            style: titleStyle().copyWith(color: Appcolor.primaryColor),
          ),
        ),
      ],
    );
  }
}
