import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/controller/auth_controller.dart';
import 'package:expense_tracker/controller/password_controller.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/decoration.dart';

import 'package:expense_tracker/constatnts/custom_widgets/common/sizedbox.dart';
import 'package:expense_tracker/constatnts/custom_widgets/login&signup/validators.dart';
import 'package:expense_tracker/models/auth_model/auth_model.dart';

import 'package:expense_tracker/view/authentication/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constatnts/custom_widgets/common/button.dart';

import '../../constatnts/custom_widgets/login&signup/textfield.dart';

class ScreenSignup extends StatefulWidget {
  const ScreenSignup({super.key});

  @override
  State<ScreenSignup> createState() => _ScreenSignupState();
}

class _ScreenSignupState extends State<ScreenSignup> {
  final formkey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final passController = TextEditingController();

  final confimPassController = TextEditingController();

  final PasswordController pass = Get.put(PasswordController());

  final AuthController authController = Get.put(AuthController());

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    confimPassController.dispose();
    super.dispose();
  }

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
          const Text(
            "Let us know about yourself",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          height30,
          Expanded(
            child: Container(
              width: Get.size.width,
              decoration: backgroundCurveDecoration(color: Appcolor.white),
              child: FractionallySizedBox(
                widthFactor: 0.85,
                child: SingleChildScrollView(
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BlankSpace(
                          height: 60,
                        ),
                        CustomTextField(
                          obscure: false,
                          controller: nameController,
                          validator: nameValidator,
                          title: 'Name',
                        ),
                        const BlankSpace(height: 40),
                        CustomTextField(
                          obscure: false,
                          controller: emailController,
                          validator: emailValidator,
                          title: 'Email',
                        ),
                        const BlankSpace(height: 40),
                        Obx(
                          () => CustomTextField(
                            obscure: pass.visibility.value,
                            controller: passController,
                            validator: passwordValidator,
                            title: 'Password',
                            icon: IconButton(
                              onPressed: () {
                                pass.changeVisibility(pass.visibility.value);
                              },
                              icon: Icon(pass.visibility.value
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                          ),
                        ),
                        const BlankSpace(height: 40),
                        CustomTextField(
                          obscure: true,
                          controller: confimPassController,
                          validator: (value) {
                            if (passController.text !=
                                confimPassController.text) {
                              return 'password not correct';
                            }
                            return null;
                          },
                          title: 'Confirm password',
                        ),
                        const BlankSpace(height: 50),
                        CustomButton(
                          title: 'Register',
                          onTap: () async {
                            if (formkey.currentState!.validate()) {
                              var pref = await SharedPreferences.getInstance();
                              pref.setBool(ScreenSplashState.keyToLogin, true);

                              authController.createUser(
                                  auth: AuthModel(
                                      name: nameController.text,
                                      email: emailController.text,
                                      password: passController.text));
                              Get.offNamed('/bottom');
                            } else {
                              Get.snackbar(
                                  'Error', 'Error occured while creating user');
                            }
                          },
                        ),
                        const BlankSpace(height: 20),
                        // BottomText(
                        //     title: "already have an account? ",
                        //     title2: "Log in",
                        //     ontap: () {
                        //       // Get.offNamed('/login');
                        //       Get.to(Users());
                        //     })
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
