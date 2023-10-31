import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/sizedbox.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/textstyle.dart';
import 'package:expense_tracker/controller/auth_controller.dart';
import 'package:expense_tracker/models/auth_model/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfile extends StatefulWidget {
  EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final AuthController authController = Get.put(
    AuthController(),
  );

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    AuthModel user = authController.authBox.getAt(0);
    nameController = TextEditingController(text: user.name);
    emailController = TextEditingController(text: user.email);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthModel user = authController.authBox.getAt(0);
    return Scaffold(
      backgroundColor: Appcolor.tertiaryColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black, size: 28),
        backgroundColor: Colors.transparent,
        title: Text(
          'Edit Profile',
          style: screenTitleText(),
        ),
        elevation: 0,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.check))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Appcolor.tertiaryColor,
                        child: Image.asset('images/user-logo.png'),
                      ),
                    ),
                    const CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.add,
                        color: Appcolor.secondaryColor,
                      ),
                    ),
                  ],
                ),
                height30,
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                height30,
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
