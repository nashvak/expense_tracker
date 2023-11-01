import 'dart:io';

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

  File? image;

// function to bottom sheet
  cameraOrGallery() {
    Get.bottomSheet(
        backgroundColor: Appcolor.tertiaryColor,
        Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Edit Profile',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  CircleAvatar(
                    backgroundColor: Appcolor.white,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ],
              ),
              height20,
              Container(
                color: Appcolor.white,
                child: Wrap(
                  children: [
                    ListTile(
                      onTap: () async {
                        image = await authController.getImag(true);
                        Get.back();
                      },
                      leading: const Icon(Icons.camera_alt),
                      title: const Text('Camera'),
                    ),
                    ListTile(
                      onTap: () async {
                        image = await authController.getImag(false);
                        Get.back();
                      },
                      leading: const Icon(Icons.photo),
                      title: const Text('Gallery'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
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
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const BlankSpace(
                            height: 60,
                          ),
                          GestureDetector(
                            onTap: () {
                              cameraOrGallery();
                            },
                            child: GetBuilder<AuthController>(
                              builder: (controller) {
                                return (image == null)
                                    ? const Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: CircleAvatar(
                                              radius: 50,
                                              backgroundColor:
                                                  Appcolor.tertiaryColor,
                                              backgroundImage: AssetImage(
                                                  'images/user-logo.png'),
                                            ),
                                          ),
                                          CircleAvatar(
                                            radius: 15,
                                            backgroundColor: Colors.white,
                                            child: Icon(
                                              Icons.add,
                                              color: Appcolor.secondaryColor,
                                            ),
                                          ),
                                        ],
                                      )
                                    : CircleAvatar(
                                        radius: 50,
                                        backgroundColor: Appcolor.tertiaryColor,
                                        backgroundImage: FileImage(image!),
                                      );
                              },
                            ),
                          ),
                          const BlankSpace(height: 20),
                          CustomTextField(
                            obscure: false,
                            controller: nameController,
                            validator: nameValidator,
                            title: 'Name',
                          ),
                          const BlankSpace(height: 20),
                          CustomTextField(
                            obscure: false,
                            controller: emailController,
                            validator: emailValidator,
                            title: 'Email',
                          ),
                          const BlankSpace(height: 20),
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
                          const BlankSpace(height: 30),

                          CustomButton(
                            title: 'Register',
                            onTap: () async {
                              if (formkey.currentState!.validate()) {
                                var pref =
                                    await SharedPreferences.getInstance();
                                pref.setBool(
                                    ScreenSplashState.keyToLogin, true);

                                authController.createUser(
                                    auth: AuthModel(
                                        name: nameController.text,
                                        email: emailController.text,
                                        password: passController.text,
                                        image: image.toString()));
                                Get.offNamed('/bottom');
                              } else {
                                Get.snackbar('Error',
                                    'Error occured while creating user');
                              }
                            },
                          ),
                          // const BlankSpace(height: 20),
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
          ),
        ],
      ),
    );
  }
}
