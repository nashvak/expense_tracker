import 'package:expense_tracker/constatnts/colors.dart';

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
          Text(
            "Create an account",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text("Let us know about yourself",
              style: TextStyle(color: Colors.white, fontSize: 15)),
          height30,
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: FractionallySizedBox(
                widthFactor: 0.85,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      height50,
                      // Text(
                      //   'Email',
                      //   style: titleStyle(),
                      // ),
                      height10,
                      CustomTextField(
                        title: 'Name',
                      ),
                      height30,
                      // Text(
                      //   'Email',
                      //   style: titleStyle(),
                      // ),
                      height10,
                      CustomTextField(
                        title: 'Email',
                      ),
                      height30,
                      // Text(
                      //   'Email',
                      //   style: titleStyle(),
                      // ),
                      height10,
                      CustomTextField(
                        title: 'Password',
                        icon: Icon(Icons.visibility),
                      ),
                      height30,
                      // Text(
                      //   'Password',
                      //   style: titleStyle(),
                      // ),
                      height10,
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
