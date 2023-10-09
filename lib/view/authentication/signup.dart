import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/custom_widgets/common/decoration.dart';

import 'package:expense_tracker/custom_widgets/common/sizedbox.dart';
import 'package:expense_tracker/custom_widgets/login&signup/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../custom_widgets/common/button.dart';
import '../../custom_widgets/login&signup/bottom_text.dart';
import '../../custom_widgets/login&signup/textfield.dart';

class ScreenSignup extends StatelessWidget {
  ScreenSignup({super.key});
  final formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confimPassController = TextEditingController();
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
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        height50,
                        height10,
                        CustomTextField(
                          obscure: false,
                          controller: nameController,
                          validator: nameValidator,
                          title: 'Name',
                        ),
                        height40,
                        CustomTextField(
                          obscure: false,
                          controller: emailController,
                          validator: emailValidator,
                          title: 'Email',
                        ),
                        height40,
                        CustomTextField(
                          obscure: true,
                          controller: passController,
                          validator: passwordValidator,
                          title: 'Password',
                          icon: const Icon(Icons.visibility),
                        ),
                        height40,
                        CustomTextField(
                          obscure: true,
                          controller: confimPassController,
                          validator: (value) {
                            if (passController != confimPassController) {
                              return 'password not correct';
                            }
                            return null;
                          },
                          title: 'Confirm password',
                        ),
                        height50,
                        CustomButton(
                          title: 'Register',
                          onTap: () {
                            if (formkey.currentState!.validate()) {
                              Get.offNamed('/bottom');
                            }
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
          ),
        ],
      ),
    );
  }
}
