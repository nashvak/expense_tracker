import 'package:get/get.dart';

String? nameValidator(String? value) {
  bool nameRegex = RegExp(r"^[a-zA-Z]+$").hasMatch(value!);
  if (value.isEmpty) {
    Get.snackbar('oops.!', 'Enter a name');
    return '';
  } else if (!nameRegex) {
    Get.snackbar('oops.!', 'Name should only contains alphabet');
    return '';
  }
  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    Get.snackbar('oops.!', 'Please enter a password');
    return '';
  }

  if (value.length < 8) {
    // return 'Password must be at least 8 characters long';
    Get.snackbar('oops.!', 'Password must be at least 8 characters long');
    return '';
  }
  return null;
}

String? emailValidator(String? value) {
  bool emailRegx = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value!);

  if (value.isEmpty) {
    // return "Enter email";
    Get.snackbar(
      'oops.!',
      'Enter email',
    );
    // Get.snackbar('oops.!', 'Please enter a password');
    return '';
  }

  if (!emailRegx) {
    // return "Enter valid Email";
    Get.snackbar('oops.!', 'Enter valid Email');
    return '';
  }
  return null;
}
