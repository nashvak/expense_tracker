// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:timezone/timezone.dart' as tz;

// class NotificationServices {
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   static final onNotification = BehaviorSubject<String?>();

//   //
//   Future<void> initializeNotifications() async {
//     AndroidInitializationSettings androidInitializationSettings =
//         const AndroidInitializationSettings('budgeticon');

//     /// W H E N    A P P    I S   C L O S E D   O N   B A C K G R O U N D
//     final details =
//         await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
//     if (details != null && details.didNotificationLaunchApp) {
//       // onNotification.add(details.payload);
//     }
//     InitializationSettings initializationSettings =
//         InitializationSettings(android: androidInitializationSettings);
//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//     );
//   }

//   Future showNotification(
//       {int id = 0, String? title, String? body, String? payLoad}) async {
//     return flutterLocalNotificationsPlugin.show(
//       id,
//       title,
//       body,
//       await notificationDetails(),
//     );
//   }

//   notificationDetails() {
//     AndroidNotificationDetails androidPlatformChannelSpecifics =
//         const AndroidNotificationDetails(
//       'channel id',
//       'channel name',
//       importance: Importance.max,
//       priority: Priority.high,
//     );
//     final NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);
//     return platformChannelSpecifics;
//   }

//   Future<void> scheduleNotification(int notificationId, String title,
//       String body, String? payload, Duration timeDifference) async {
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//         notificationId,
//         title,
//         body,
//         tz.TZDateTime.now(tz.local).add(timeDifference),
//         notificationDetails(),
//         uiLocalNotificationDateInterpretation:
//             UILocalNotificationDateInterpretation.absoluteTime,
//         matchDateTimeComponents: DateTimeComponents.time,
//         payload: 'scheduled notification');
//   }

//   //  CANCEL NOTIFICATION
//   Future<void> cancelNotification(notificationId) async {
//     await flutterLocalNotificationsPlugin.cancel(notificationId);
//   }

//   // Future<void> requestNotificationPermission() async {
//   //   // Request notification permission
//   //   await flutterLocalNotificationsPlugin
//   //       .resolvePlatformSpecificImplementation<
//   //           IOSFlutterLocalNotificationsPlugin>()
//   //       ?.requestPermissions(
//   //         alert: true,
//   //         badge: true,
//   //         sound: true,
//   //       );
//   // }
// }
