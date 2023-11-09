//import 'package:get/get.dart';

String? amountValidator(value) {
  if (value == null) {
    // Get.snackbar('oops.!', 'Enter the amount');
    return 'Enter the amount';
  } else if (int.parse(value) < 0) {
    return 'negative values are not accepted';
  } else {
    return null;
  }
}
