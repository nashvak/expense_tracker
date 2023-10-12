String? nameValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please Enter a valid name';
  }
  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a password';
  }

  if (value.length < 8) {
    return 'Password must be at least 8 characters long';
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
    return "Enter valid Email";
  }
  return null;
}
