import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/custom_widgets/common/sizedbox.dart';
import 'package:expense_tracker/custom_widgets/common/textstyle.dart';
import 'package:flutter/material.dart';

class ScreenProfile extends StatelessWidget {
  ScreenProfile({super.key});
  final List<String> title = ['Nashva k', 'nashvak@gmail.com', 'Logout'];
  final List<Icon> icons = [
    const Icon(Icons.person),
    const Icon(Icons.email),
    const Icon(Icons.logout)
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
        backgroundColor: Colors.transparent,
        elevation: 0,
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
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              child: ListView.separated(
                  itemBuilder: (context, index) {
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
            )
          ],
        ),
      ),
    );
  }
}
