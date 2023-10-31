import 'package:expense_tracker/constatnts/colors.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.tertiaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Notifications',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          ListTile(
            trailing: Switch.adaptive(value: true, onChanged: (value) {}),
            title: Text('Show notifications'),
          )
        ],
      ),
    );
  }
}
