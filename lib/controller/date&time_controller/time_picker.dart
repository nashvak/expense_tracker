// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class TimePicker extends GetxController {
//   TimeOfDay selectedTime = TimeOfDay.now();

//   void pickTime() async {
//     final pickedTime = await showTimePicker(
//       context: Get.overlayContext!,
//       initialTime: selectedTime,
//     );

//     if (pickedTime != null) {
//       print(pickedTime);
//       selectedTime = pickedTime;

//       print(selectedTime);
//       await showDailyNotification(0, 'Daily Notification',
//           'This is your daily notification', selectedTime);
//     }
//   }
// }

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
