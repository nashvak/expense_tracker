import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/view/history/history_screen.dart';
import 'package:expense_tracker/view/transaction/add_transaction.dart';
import 'package:expense_tracker/view/transaction/home_screen.dart';
import 'package:expense_tracker/view/profile/profile_screen.dart';
import 'package:expense_tracker/view/remainder/remainder_screen.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int myIndex = 0;
  List<Widget> icons = [
    const Icon(Icons.home, size: 30),
    const Icon(Icons.add, size: 30),
    const Icon(Icons.history, size: 30),
    const Icon(Icons.calendar_view_month, size: 30),
    const Icon(Icons.person, size: 30),
  ];
  List<Widget> screens = [
    const ScreenHome(),
    ScreenAddTransaction(),
    const ScreenHistory(),
    ScreenRemainder(),
    ScreenProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[myIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: const IconThemeData(color: Appcolor.white)),
        child: CurvedNavigationBar(
            height: 60,
            backgroundColor: Colors.transparent,
            // backgroundColor: Appcolor.tertiaryColor,
            buttonBackgroundColor: Appcolor.primaryColor,
            animationDuration:
                const Duration(milliseconds: 300), //default is 600
            color: Appcolor.primaryColor,
            onTap: (index) {
              setState(
                () {
                  myIndex = index;
                },
              );
            },
            items: icons),
      ),
    );
  }
}
