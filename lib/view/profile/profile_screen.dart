import 'dart:io';

import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/sizedbox.dart';

import 'package:expense_tracker/controller/auth_controller.dart';
import 'package:expense_tracker/controller/transaction_controller.dart';
import 'package:expense_tracker/models/auth_model/auth_model.dart';
import 'package:expense_tracker/view/authentication/get_started.dart';
import 'package:expense_tracker/view/profile/edit_profile.dart';
import 'package:expense_tracker/view/profile/notification.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ScreenProfile extends StatefulWidget {
  const ScreenProfile({super.key});

  @override
  State<ScreenProfile> createState() => _ScreenProfileState();
}

class _ScreenProfileState extends State<ScreenProfile> {
  final AuthController authController = Get.put(
    AuthController(),
  );

  final TransactionController transactionController = Get.put(
    TransactionController(),
  );

  logoutProfile(context) async {
    var pref = await SharedPreferences.getInstance();

    await pref.clear();

    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const GetStartedScreen(),
      ),
    );
    authController.authBox.clear();
  }

  dialogBox() {
    Get.defaultDialog(
      title: 'Erase data',
      middleText:
          'This will remove all your data.Are you sure to delete all data.',
      backgroundColor: Appcolor.white,
      radius: 20,
      contentPadding: const EdgeInsets.all(10),
      titlePadding: const EdgeInsets.all(20),
      confirm: TextButton(
        onPressed: () {
          transactionController.logoutProfile();
          Get.back();
        },
        child: const Text('Erase'),
      ),
      cancel: TextButton(
        onPressed: () {
          Get.back();
        },
        child: const Text('Cancel'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    AuthModel user = authController.authBox.getAt(0);
    print(user.image);
    return Scaffold(
      backgroundColor: Appcolor.primaryColor,
      appBar: AppBar(
        title: const Text(
          'Profile ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          (user.image != null)
              ? CircleAvatar(
                  radius: 50,
                  backgroundColor: Appcolor.tertiaryColor,
                  backgroundImage: FileImage(File(user.image!)),
                )
              : CircleAvatar(
                  radius: 50,
                  backgroundColor: Appcolor.tertiaryColor,
                  backgroundImage: AssetImage('images/user-logo.png'),
                ),
          height10,
          Text(
            user.name,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            user.email,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
          height20,
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              decoration: ShapeDecoration(
                color: Appcolor.tertiaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, left: 15, right: 15, bottom: 0),
                child: Column(
                  children: [
                    height30,
                    ProfileCard(
                      title: 'Edit Profile',
                      icon: Icons.person,
                      backgroundColor: const Color.fromARGB(255, 251, 231, 171),
                      iconColor: const Color.fromARGB(255, 223, 168, 4),
                      ontap: () {
                        Get.to(const EditProfile());
                      },
                    ),
                    height20,
                    ProfileCard(
                      title: 'Notifications',
                      icon: Icons.notifications,
                      backgroundColor: const Color.fromARGB(255, 184, 207, 238),
                      iconColor: const Color.fromARGB(255, 37, 121, 231),
                      ontap: () {
                        Get.to(const NotificationPage());
                      },
                    ),
                    height20,
                    ProfileCard(
                      title: 'Erase all data',
                      icon: Icons.delete,
                      backgroundColor: const Color.fromARGB(255, 247, 196, 228),
                      iconColor: const Color.fromARGB(255, 243, 63, 177),
                      ontap: () {
                        dialogBox();
                      },
                    ),
                    height20,
                    ProfileCard(
                      title: 'Logout',
                      icon: Icons.logout,
                      backgroundColor: const Color.fromARGB(255, 188, 244, 201),
                      iconColor: const Color.fromARGB(255, 30, 213, 73),
                      ontap: () {
                        logoutProfile(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard(
      {required this.title,
      required this.icon,
      required this.backgroundColor,
      required this.iconColor,
      required this.ontap,
      super.key});
  final String title;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Card(
        color: Appcolor.white,
        child: ListTile(
          leading: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: backgroundColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  icon,
                  color: iconColor,
                ),
              )),
          title: Text(
            title,
            style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
