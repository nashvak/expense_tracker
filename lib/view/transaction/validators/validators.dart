//import 'package:get/get.dart';

String? amountValidator(String? value) {
  try {
    double.parse(value!); // Attempt to parse the input as a double
    return null; // Input is a valid double
  } catch (e) {
    return 'Please enter a valid double value.';
  }
}

String? descriptionValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Add any description';
  }
  return null;
}
