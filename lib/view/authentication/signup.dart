import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/custom_widgets/button.dart';
import 'package:expense_tracker/custom_widgets/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
                      Container(
                          height: 55,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(136, 216, 216, 210),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: const TextField(
                            showCursor: false,
                            decoration: InputDecoration(
                              hintText: 'Name',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(20),
                            ),
                          )),
                      height30,
                      // Text(
                      //   'Email',
                      //   style: titleStyle(),
                      // ),
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
                              hintText: 'Email',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(20),
                            ),
                          )),
                      height30,
                      // Text(
                      //   'Email',
                      //   style: titleStyle(),
                      // ),
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
                              hintText: 'Password',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(20),
                              suffixIcon: Icon(Icons.visibility),
                            ),
                          )),
                      height30,
                      // Text(
                      //   'Password',
                      //   style: titleStyle(),
                      // ),
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
                            hintText: 'Confirm password',
                          ),
                        ),
                      ),
                      height50,
                      CustomButton(
                        title: 'Register',
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
                              Text("already have an account? ",
                                  style: titleStyle()),
                              GestureDetector(
                                onTap: () {
                                  Get.offNamed('/login');
                                },
                                child: Text(
                                  "Log in",
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
