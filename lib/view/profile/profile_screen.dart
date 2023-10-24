import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/sizedbox.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/textstyle.dart';
import 'package:expense_tracker/controller/auth_controller.dart';
import 'package:expense_tracker/models/auth_model/auth_model.dart';
import 'package:expense_tracker/view/authentication/get_started.dart';
import 'package:expense_tracker/view/authentication/login.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenProfile extends StatelessWidget {
  ScreenProfile({super.key});
  final AuthController authController = Get.put(AuthController());

  final List<IconButton> icons = [
    IconButton(
      onPressed: () {},
      icon: const Icon(Icons.person),
    ),
    IconButton(
      onPressed: () {},
      icon: const Icon(Icons.email),
    ),
    IconButton(
      onPressed: () {},
      icon: const Icon(Icons.logout),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.tertiaryColor,
      appBar: AppBar(
        title: Text(
          'Profile ',
          style: screenTitleText(),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(Users());
            },
            icon: const Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () async {
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
            },
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Appcolor.primaryColor),
                  borderRadius: BorderRadius.circular(60)),
              child: const CircleAvatar(
                radius: 60,
                backgroundColor: Appcolor.tertiaryColor,
                //child: Image.asset('images/expense-logo.png'),
                child: Text('Add photo'),
              ),
            ),
            height40,
            Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    AuthModel user = authController.authBox.getAt(0);
                    final List<String> title = [
                      user.name,
                      user.email,
                      'Delete all data'
                    ];
                    return ListTile(
                      leading: icons[index],
                      title: Text(title[index]),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: Appcolor.secondaryColor,
                    );
                  },
                  itemCount: 3),
            ),
          ],
        ),
      ),
    );
  }
}
