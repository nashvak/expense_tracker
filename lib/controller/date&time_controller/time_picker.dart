import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimePicker extends GetxController {
  TimeOfDay selectedTime = const TimeOfDay(
    hour: 21,
    minute: 00,
  );
  // @override
  // void onInit() {
  //   defaultTime();
  //   super.onInit();
  // }

  // late TimeOfDay selectedTime;

  defaultTime() async {
    // TimeOfDay selectedDate;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? storedHour = prefs.getInt('notificationHour');
    final int? storedMinute = prefs.getInt('notificationMinute');

    if (storedHour != null && storedMinute != null) {
      selectedTime = TimeOfDay(hour: storedHour, minute: storedMinute);
      print('In shared preference');
      print(selectedTime);
    } else {
      selectedTime = const TimeOfDay(hour: 21, minute: 00);
      print('default set time');
      print(selectedTime);
    }
  }

  void pickTime() async {
    final pickedTime = await showTimePicker(
      context: Get.overlayContext!,
      initialTime: selectedTime,
    );

    if (pickedTime != null) {
      print("Picked time");
      print(pickedTime);
      selectedTime = pickedTime;

      print(selectedTime);
      // await showDailyNotification(0, 'Daily Notification',
      //     'This is your daily notification', selectedTime);
    }
  }
}

//   Future<void> showDailyNotification(
//       int id, String title, String body, TimeOfDay notificationTime) async {
//     _scheduledDate = _nextInstanceOfTime(notificationTime);
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       id,
//       title,
//       body,
//       _scheduledDate,
//       const NotificationDetails(
//         android: AndroidNotificationDetails(
//           'daily_notification_channel',
//           'Daily Notification',
//         ),
//       ),
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//       matchDateTimeComponents: DateTimeComponents.time,
//     );
//   }

//   tz.TZDateTime _nextInstanceOfTime(TimeOfDay notificationTime) {
//     final now = tz.TZDateTime.now(_location);
//     final scheduledDate = tz.TZDateTime(
//       _location,
//       now.year,
//       now.month,
//       now.day,
//       notificationTime.hour,
//       notificationTime.minute,
//     );

//     return scheduledDate.isBefore(now)
//         ? scheduledDate.add(const Duration(days: 1))
//         : scheduledDate;
//   }
// }
