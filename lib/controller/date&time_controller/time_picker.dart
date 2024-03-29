// import 'package:expense_tracker/view/notification/notification_settings.dart';
// import 'package:expense_tracker/view/transaction/snackbars/snackbar.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:async/async.dart';

// class TimePicker extends GetxController {
//   NotificationServices notificationServices = NotificationServices();
//   @override
//   void onInit() async {
//     await loadSwitchState();
//     // print(selectedTime);
//     super.onInit();
//   }

//   TimeOfDay? selectedTime;
//   int notificationId = 1;
//   bool _isNotification = false;
//   bool get isNotification => _isNotification;
//   bool visibility = false;
//   bool get isVisibility => visibility;

//   Future<void> loadSwitchState() async {
//     await loadToggleValue();
//     // print(_isNotification);
//     if (_isNotification) {
//       await setdefaultTime();
//       visibility = _isNotification;
//     } else {
//       await cancelNOtification();
//     }

//     update();
//   }
//   // late TimeOfDay selectedTime;

//   setdefaultTime() async {
//     // TimeOfDay selectedDate;
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     final int? storedHour = prefs.getInt('notificationHour');
//     final int? storedMinute = prefs.getInt('notificationMinute');

//     if (storedHour != null && storedMinute != null) {
//       selectedTime = TimeOfDay(hour: storedHour, minute: storedMinute);
//     } else {
//       selectedTime = const TimeOfDay(hour: 21, minute: 30);
//     }
//     // showNotification(selectedTime!.hour, selectedTime!.minute);
//     update();
//   }

//   void pickTime() async {
//     TimeOfDay? pickedTime = await showTimePicker(
//       context: Get.overlayContext!,
//       initialTime: selectedTime!,
//     );

//     if (pickedTime != null) {
//       selectedTime = pickedTime;
//       final SharedPreferences prefs = await SharedPreferences.getInstance();
//       prefs.setInt('notificationHour', pickedTime.hour);
//       prefs.setInt('notificationMinute', pickedTime.minute);
//       selectedTime =
//           TimeOfDay(hour: pickedTime.hour, minute: pickedTime.minute);
//       showNotification(pickedTime.hour, pickedTime.minute);
//     }
//     // else {
//     //   showNotification(selectedTime!.hour, selectedTime!.hour);
//     // }
//     update();
//   }

//   showNotification(int hour, int minute) async {
//     DateTime scheduledTime = DateTime(
//       DateTime.now().year,
//       DateTime.now().month,
//       DateTime.now().day,
//       hour,
//       minute,
//     );

//     // If the selected time is in the past, schedule for the next day
//     if (scheduledTime.isBefore(DateTime.now())) {
//       scheduledTime.add(const Duration(days: 1));
//     }

//     // Calculate the time difference between now and the scheduled time
//     final timeDifference = scheduledTime.difference(DateTime.now());
//     if (_isNotification) {
//       await notificationServices.scheduleNotification(
//         notificationId,
//         'Reminder',
//         'Did you record all your transactions today.? ',
//         'payload',
//         timeDifference,
//       );

//       ToastUtil.showToast(
//           'Daily notification scheduled at ${DateFormat.Hm().format(scheduledTime)}');
//     }
//   }
//   //  C A N C E L   N O T I F I C A T I O N

//   Future<void> cancelNOtification() async {
//     await notificationServices.cancelNotification(notificationId);

//     update();
//   }

//   //  T O G G L E    S W I T C H    N O T I F I C A T I O N   O N    O R   O F F
//   onToggle(bool value) async {
//     _isNotification = value;
//     // if (_isNotification) {
//     //   await notificationServices.requestNotificationPermission();
//     // }
//     saveToggleValue();
//     visibility = value;
//     timeVisibility();
//     update();
//   }

//   //  T I M E   V I S I B L E   O R   N O T
//   timeVisibility() {
//     if (_isNotification == true) {
//       setdefaultTime();
//     } else {
//       cancelNOtification();
//     }
//     update();
//   }

//   //  S A V E    T O   S H A R E D   P R E F E R E N C E
//   saveToggleValue() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setBool('toggle', _isNotification);
//     // print(_isNotification);
//     update();
//   }

// //  G E T   V A L U E   F R O M   S H A R E D   P R E F E R E N C E

//   loadToggleValue() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     _isNotification = prefs.getBool('toggle') ?? false;
//     update();
//   }
// }
