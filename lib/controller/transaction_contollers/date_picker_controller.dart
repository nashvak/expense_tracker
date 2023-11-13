import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DatePickerController extends GetxController {
  DateTime selectedDate = DateTime.now();
  //  F U N C T I O N    T O   P I C K    D A TE
  getDate(context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2023),
        lastDate: DateTime.now());
    await updateDate(pickedDate!);

    update();
    return selectedDate;
  }

//  C H A N G E   D A T E
  updateDate(DateTime newDate) {
    selectedDate = newDate;
  }

//  F O R M A T    D A T E
  dateFormat() async {
    return DateFormat('dd/MM/yyyy').format(selectedDate);
  }
  //   R E S E T   D A T E

  resetDate() {
    selectedDate = DateTime.now();
  }
}
