// import 'package:get/get.dart';

String? nameValidator(String? value) {
  bool nameRegex = RegExp("[a-zA-Z][a-zA-Z ]*").hasMatch(value!);
  if (value.isEmpty) {
    //Get.snackbar('oops.!', 'Enter a name');
    return 'Enter a name';
  } else if (!nameRegex) {
    //Get.snackbar('oops.!', 'Name should only contains alphabet');

    return 'Name should only contains alphabet';
  }
  return null;
}

String? numberValidator(String? value) {
  if (value == null || value.isEmpty) {
    // Get.snackbar('oops.!', 'Please enter a password');
    return 'Please enter phone number';
  }

  if (value.length < 10) {
    return 'Invalid number';
    //Get.snackbar('oops.!', 'Password must be at least 8 characters long');
    // return '';
  }
  return null;
}

String? emailValidator(String? value) {
  bool emailRegx = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value!);

  if (value.isEmpty) {
    return "Enter email";
    // Get.snackbar(
    //   'oops.!',
    //   'Enter email',
    // );

    // return '';
  }

  if (!emailRegx) {
    // return "Enter valid Email";
    // Get.snackbar('oops.!', 'Enter valid Email');
    return 'invalid email';
  }
  return null;
}
