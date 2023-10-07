import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/custom_widgets/common/decoration.dart';

import 'package:expense_tracker/custom_widgets/common/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../custom_widgets/common/button.dart';
import '../../custom_widgets/loginPage/login_widgets.dart';

class ScreenSignup extends StatelessWidget {
  const ScreenSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolor.primaryColor,
        elevation: 0,
      ),
      backgroundColor: Appcolor.primaryColor,
      body: Column(
        children: [
          const Text(
            "Create an account",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const Text("Let us know about yourself",
              style: TextStyle(color: Colors.white, fontSize: 15)),
          height30,
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: backgroundCurveDecoration(color: Appcolor.white),
              child: FractionallySizedBox(
                widthFactor: 0.85,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      height50,
                      height10,
                      CustomTextField(
                        title: 'Name',
                      ),
                      height40,
                      CustomTextField(
                        title: 'Email',
                      ),
                      height40,
                      CustomTextField(
                        title: 'Password',
                        icon: const Icon(Icons.visibility),
                      ),
                      height40,
                      CustomTextField(
                        title: 'Confirm password',
                      ),
                      height50,
                      CustomButton(
                        title: 'Register',
                        onTap: () {
                          Get.offNamed('/home');
                        },
                      ),
                      height20,
                      BottomText(
                          title: "already have an account? ",
                          title2: "Log in",
                          ontap: () {
                            Get.offNamed('/login');
                          })
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
