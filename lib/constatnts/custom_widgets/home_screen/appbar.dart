import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomescreenAppbar extends StatelessWidget {
  const HomescreenAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello,',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            Text(
              'Nashva',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed('/addtransaction');
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 40,
          ),
        )
      ],
    );
  }
}
