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
    return 'Please enter phone number';
  }

  if (value.length != 10) {
    return 'Invalid number';
  }
  return null;
}

String? emailValidator(String? value) {
  bool emailRegx = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value!);

  if (value.isEmpty) {
    return "Enter email";
  }

  if (!emailRegx) {
    return 'invalid email';
  }
  return null;
}
