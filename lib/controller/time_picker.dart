import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimePicker extends GetxController {
  TimeOfDay selectedTime = TimeOfDay.now();

  void pickTime() async {
    final pickedTime = await showTimePicker(
      context: Get.overlayContext!,
      initialTime: selectedTime,
    );

    if (pickedTime != null) {
      selectedTime = pickedTime;
    }
    update();
  }
}
