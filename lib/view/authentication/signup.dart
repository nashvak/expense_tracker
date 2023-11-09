import 'dart:io';
import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/controller/authentication_section/auth_controller.dart';
import 'package:expense_tracker/controller/authentication_section/signup_controller.dart';
import 'package:expense_tracker/controller/authentication_section/splashscreen_contoller.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/decoration.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/sizedbox.dart';
import 'package:expense_tracker/view/authentication/validators.dart';
import 'package:expense_tracker/models/auth_model/auth_model.dart';
import 'package:expense_tracker/view/authentication/bottomsheets.dart';
import 'package:expense_tracker/view/home_screen/bottom_nav.dart';
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
  final phoneController = TextEditingController();

  final AuthController authController = Get.put(AuthController());
  final SplashScreenContoller splash = Get.put(SplashScreenContoller());
  final SignupController signupController = Get.put(SignupController());

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  addProfile() async {
    if (formkey.currentState!.validate()) {
      var pref = await SharedPreferences.getInstance();
      pref.setBool(splash.keyToLogin, true);

      String imageUrl = (image == null)
          ? await signupController.copyAssetImageToLocalFile()
          : image!.path;

      authController.createUser(
        auth: AuthModel(
          name: nameController.text.trim(),
          email: emailController.text.trim(),
          phone: int.parse(phoneController.text.trim()),
          image: imageUrl,
        ),
      );
      Get.offAll(() => const BottomNav());
    } else {
      Get.snackbar('Error', 'Cannot create user');
    }
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
                                        backgroundImage:
                                            FileImage(File(image!.path)),
                                      );
                              },
                            ),
                          ),
                          const BlankSpace(height: 20),
                          CustomTextField(
                            controller: nameController,
                            validator: nameValidator,
                            title: 'Name',
                            icon: const Icon(Icons.person),
                            type: TextInputType.text,
                          ),
                          const BlankSpace(height: 20),
                          CustomTextField(
                            controller: emailController,
                            validator: emailValidator,
                            type: TextInputType.emailAddress,
                            title: 'Email',
                            icon: const Icon(Icons.email),
                          ),
                          const BlankSpace(height: 20),
                          CustomTextField(
                            controller: phoneController,
                            validator: passwordValidator,
                            type: TextInputType.number,
                            title: 'Phone number',
                            icon: const Icon(Icons.phone_android),

                            // icon: IconButton(
                            //   onPressed: () {
                            //     pass.changeVisibility(pass.visibility.value);
                            //   },
                            //   icon: Icon(pass.visibility.value
                            //       ? Icons.visibility
                            //       : Icons.visibility_off),
                            // ),
                          ),
                          const BlankSpace(height: 30),
                          CustomButton(
                            title: 'Register',
                            onTap: () async {
                              addProfile();
                            },
                          ),
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
