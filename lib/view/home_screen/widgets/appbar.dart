import 'package:expense_tracker/controller/authentication_section/auth_controller.dart';
import 'package:expense_tracker/models/auth_model/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomescreenAppbar extends StatelessWidget {
  const HomescreenAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AuthModel user = AuthController().authBox.get(0);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hello,',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            Text(
              user.name.toString().capitalize!,
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ],
        ),
        // GestureDetector(
        //   onTap: () {
        //     Get.toNamed('/addtransaction');
        //   },
        //   child: const Icon(
        //     Icons.add,
        //     color: Colors.white,
        //     size: 40,
        //   ),
        // )
      ],
    );
  }
}
