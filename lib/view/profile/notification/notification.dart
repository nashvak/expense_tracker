import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/sizedbox.dart';
import 'package:expense_tracker/controller/date&time_controller/time_picker.dart';
import 'package:expense_tracker/view/profile/notification/notification_settings.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  // final TimePicker time = Get.put(TimePicker());
  NotificationServices notificationServices = NotificationServices();

  Future<void> scheduleDailyNotification() async {
    // Get the user-selected time
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      // Schedule the notification
      DateTime scheduledTime = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        selectedTime.hour,
        selectedTime.minute,
      );

      await notificationServices.scheduleNotification(
        1,
        'Daily Notification',
        'This is your daily notification',
        'payload',
        scheduledTime,
      );

      // Inform the user that the notification is scheduled
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Daily notification scheduled at ${DateFormat.Hm().format(scheduledTime)}'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.tertiaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.notifications,
                    color: Colors.orange,
                    size: 30,
                  ),
                ),
                BlankSpace(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                      'You can now set the alarm directly on Money Manager, Therefore Money manager would remind you at your selected time of the day to the key in your data.'),
                )
              ],
            ),
            const BlankSpace(
              height: 20,
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              trailing: Switch.adaptive(value: true, onChanged: (value) {}),
              title: const Text('Show notifications'),
            ),
            const BlankSpace(
              height: 20,
            ),
            const Text(
              "Alarm",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            height20,
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Text(TimeOfDay.now().toString()),
              trailing: GestureDetector(
                onTap: () {
                  scheduleDailyNotification();
                },
                child: const Icon(Icons.alarm),
              ),
            ),
          ],
        ),
      ),
//             ElevatedButton(
//               onPressed: () {
// // notificationServices.scheduleNotification(
// //                     title: 'Hey',
// //                     body: ' Did you record your daily transactions',
// //                     scheduledNotificationDateTime: time.selectedTime)
//               },
//               child: const Text('send notification'),
//             ),
    );
  }
}
