import 'package:expense_tracker/view/profile/notification/notification_settings.dart';
import 'package:expense_tracker/view/transaction/snackbars/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimePicker extends GetxController {
  NotificationServices notificationServices = NotificationServices();
  TimeOfDay? selectedTime;
  int notificationId = 1;
  bool isNotificationEnabled = true;
  bool visibility = true;

  @override
  void onInit() {
    setdefaultTime();
    super.onInit();
  }

  // late TimeOfDay selectedTime;

  setdefaultTime() async {
    // TimeOfDay selectedDate;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? storedHour = prefs.getInt('notificationHour');
    final int? storedMinute = prefs.getInt('notificationMinute');

    if (storedHour != null && storedMinute != null) {
      selectedTime = TimeOfDay(hour: storedHour, minute: storedMinute);
    } else {
      selectedTime = const TimeOfDay(hour: 21, minute: 00);
    }
    update();
  }

  void pickTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: Get.overlayContext!,
      initialTime: selectedTime!,
    );

    if (pickedTime != null) {
      selectedTime = pickedTime;
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt('notificationHour', pickedTime.hour);
      prefs.setInt('notificationMinute', pickedTime.minute);
      selectedTime =
          TimeOfDay(hour: pickedTime.hour, minute: pickedTime.minute);

      DateTime scheduledTime = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        pickedTime.hour,
        pickedTime.minute,
      );

      // If the selected time is in the past, schedule for the next day
      if (scheduledTime.isBefore(DateTime.now())) {
        scheduledTime.add(const Duration(days: 1));
      }

      // Calculate the time difference between now and the scheduled time
      final timeDifference = scheduledTime.difference(DateTime.now());
      await notificationServices.scheduleNotification(
        notificationId,
        'Daily reminder',
        'Did you record all your transactions.? ',
        'payload',
        timeDifference,
      );

      ToastUtil.showToast(
          'Daily notification scheduled at ${DateFormat.Hm().format(scheduledTime)}');
    }
    update();
  }

  //  C A N C E L   N O T I F I C A T I O N

  Future<void> cancelNOtification() async {
    if (isNotificationEnabled) {
      await notificationServices.cancelNotification(notificationId);
    }
    update();
  }

  onToggle(bool value) {
    isNotificationEnabled = value;
    visibility = value;
    update();
  }
}
