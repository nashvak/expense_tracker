import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/custom_widgets/common/button.dart';
import 'package:expense_tracker/custom_widgets/common/sizedbox.dart';
import 'package:expense_tracker/custom_widgets/loginPage/login_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.primaryColor,
      body: Column(
        children: [
          const Image(
            image: AssetImage('images/expense-logo.png'),
            height: 250,
            width: 500,
          ),
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
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Login to your account',
                          style: GoogleFonts.lato(fontSize: 24),
                        ),
                      ),
                      height30,
                      Text(
                        'Email',
                        style: titleStyle(),
                      ),
                      height10,
                      CustomTextField(
                        title: 'Email',
                      ),
                      height30,
                      Text(
                        'Password',
                        style: titleStyle(),
                      ),
                      height10,
                      CustomTextField(
                        title: 'Password',
                        icon: Icon(Icons.visibility),
                      ),
                      height50,
                      CustomButton(
                        title: 'Login',
                        onTap: () {
                          Get.offNamed('/bottom');
                        },
                      ),
                      height20,
                      BottomText(
                          title: "Don't have an account? ",
                          title2: "Sign in",
                          ontap: () {
                            Get.offNamed('/signup');
                          })
                      //
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
