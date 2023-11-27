import 'package:flutter/material.dart';

class SortingBottomSheet extends StatelessWidget {
  const SortingBottomSheet(
      {required this.ontap, required this.title, super.key});
  final Function() ontap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      title: Text(title),
      onTap: ontap,
    );
  }
}
