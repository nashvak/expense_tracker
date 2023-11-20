//import 'package:get/get.dart';

String? amountValidator(String? value) {
  try {
    double inputValue = double.parse(value!);
    if (inputValue < 0) {
      return 'Please enter a positive number';
    }
    return null; // Input is a valid double
  } catch (e) {
    return 'Please enter a valid number';
  }
}

String? descriptionValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Add any description';
  }
  return null;
}
