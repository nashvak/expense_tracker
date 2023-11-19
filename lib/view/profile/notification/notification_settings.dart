import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationServices {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initializeNotifications() async {
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings('expense_logo');

    InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitializationSettings);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

// //   void scheduledNotification(String title, String body) async {
// //     AndroidNotificationDetails androidNotificationDetails =
// //         const AndroidNotificationDetails(
// //       'channelId',
// //       'channelName',
// //       playSound: true,
// //       importance: Importance.max,
// //       priority: Priority.high,
// //     );
// //     NotificationDetails notificationDetails =
// //         NotificationDetails(android: androidNotificationDetails);

// //     await flutterLocalNotificationsPlugin.show(
// //         0, title, body, notificationDetails);
// //     // await flutterLocalNotificationsPlugin.zonedSchedule(
// //     //   0,
// //     //   title,
// //     //   body,
// //     //   // tz.TZDateTime.from(scheduledTime, tz.local),
// //     //   // platformChannelSpecifics,
// //     //   uiLocalNotificationDateInterpretation:
// //     //       UILocalNotificationDateInterpretation.absoluteTime,
// //     //   matchDateTimeComponents: DateTimeComponents.time,
// //     // );
// //   }

// //   Future scheduleNotification(
// //       {int id = 0,
// //       String? title,
// //       String? body,
// //       String? payload,
// //       required DateTime scheduledNotificationDateTime}) async{
// //         return flutterLocalNotificationsPlugin.zonedSchedule(id, title, body, tz.TZDateTime.from(
// //           scheduledNotificationDateTime,
// //           tz.local,
// //         ), await noti, uiLocalNotificationDateInterpretation: uiLocalNotificationDateInterpretation)
// //       }
// // }

  Future showNotification(
      {int id = 0, String? title, String? body, String? payLoad}) async {
    return flutterLocalNotificationsPlugin.show(
        id, title, body, await notificationDetails());
  }

  notificationDetails() {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        const AndroidNotificationDetails(
            'daily_notification_channel', 'Daily Notification Channel',
            importance: Importance.max, priority: Priority.high);
    final NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    return platformChannelSpecifics;
  }
//   Future scheduleNotification(
//       {int id = 0,
//       String? title,
//       String? body,
//       String? payLoad,
//       required DateTime scheduledNotificationDateTime}) async {
//     return notificationsPlugin.zonedSchedule(
//         id,
//         title,
//         body,
//         tz.TZDateTime.from(
//           scheduledNotificationDateTime,
//           tz.local,
//         ),
//         await notificationDetails(),
//         uiLocalNotificationDateInterpretation:
//             UILocalNotificationDateInterpretation.absoluteTime);
//   }

  Future<void> scheduleNotification(int notificationId, String title,
      String body, String? payload, DateTime scheduledTime) async {
    // AndroidNotificationDetails androidPlatformChannelSpecifics =
    //     const AndroidNotificationDetails(
    //         'daily_notification_channel', 'Daily Notification Channel',
    //         importance: Importance.max, priority: Priority.high);
    // final NotificationDetails platformChannelSpecifics =
    //     NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      notificationId,
      title,
      body,
      tz.TZDateTime.from(scheduledTime, tz.local),
      notificationDetails(),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}
