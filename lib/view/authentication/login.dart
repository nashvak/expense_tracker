import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/custom_widgets/button.dart';
import 'package:expense_tracker/custom_widgets/sizedbox.dart';
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
                      Container(
                          height: 55,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(136, 216, 216, 210),
                              borderRadius: BorderRadius.circular(40)),
                          child: const TextField(
                            showCursor: false,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(20),
                            ),
                          )),
                      height30,
                      Text(
                        'Password',
                        style: titleStyle(),
                      ),
                      height10,
                      Container(
                        height: 55,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(136, 216, 216, 210),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: const TextField(
                          showCursor: false,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(20),
                              hintText: 'Password',
                              suffixIcon: Icon(Icons.visibility)),
                        ),
                      ),
                      height50,
                      CustomButton(
                        title: 'Login',
                        onTap: () {
                          Get.offNamed('/home');
                        },
                      ),
                      height10,
                      Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account? ",
                                  style: titleStyle()),
                              GestureDetector(
                                onTap: () {
                                  Get.offNamed('/signup');
                                },
                                child: Text(
                                  "Sign in",
                                  style: titleStyle()
                                      .copyWith(color: Appcolor.primaryColor),
                                ),
                              ),
                            ],
                          )),
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
