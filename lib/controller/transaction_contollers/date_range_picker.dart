// //   D A T E   R A N G E  P I C K E R
// import 'package:expense_tracker/controller/transaction_contollers/transaction_controller.dart';
// import 'package:flutter/material.dart';
// // import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class DateRangePickerController extends GetxController {
//   TransactionController transactionController = TransactionController();
//   void selectDateRange() async {
//     transactionController.startDate = DateTime.now();
//     transactionController.endDate = DateTime.now();
//     final DateTimeRange? picked = await showDateRangePicker(
//       context: Get.context!,
//       initialDateRange: DateTimeRange(
//         start: transactionController.startDate,
//         end: transactionController.endDate,
//       ),
//       firstDate: DateTime(2023),
//       lastDate: DateTime.now(),
//     );

//     try {
//       if (picked != null) {
//         transactionController.startDate = picked.start;
//         transactionController.endDate = picked.end;

//         await transactionController.changeOption(
//             'Date'); // if date is picked,then only this function should work

//         update();
//       }
//     } catch (e) {
//       print('Not picked');
//     }
//   }
// }
