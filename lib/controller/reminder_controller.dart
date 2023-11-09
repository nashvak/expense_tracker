// import 'package:expense_tracker/models/reminder_model/reminder_model.dart';
// import 'package:hive/hive.dart';
// import 'package:get/get.dart';

// class RemainderController extends GetxController {
//   final Box reminderBox = Hive.box<Remainder>('remainderBox');

//   int get remainderCount => reminderBox.length;
//   createRemainder({required Remainder rem}) async {
//     await reminderBox.add(rem);
//     update();
//   }

//   updateRemainder({required int index, required Remainder rem}) {
//     reminderBox.putAt(index, rem);
//     update();
//   }

//   deleteRemainder({required int index}) {
//     reminderBox.deleteAt(index);
//     update();
//   }
// }
