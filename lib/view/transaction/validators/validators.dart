//import 'package:get/get.dart';

String? amountValidator(String? value) {
  try {
    if (value != null) {
      double inputValue = double.parse(value);
      if (inputValue < 0) {
        return 'Please enter a positive number';
      }
      if (inputValue.toString().length > 12) {
        return 'Enter valid amount';
      }
      return null;
    } else if (value == null) {
      return 'Please enter a valid number';
    }
    return null;
    // Input is a valid double
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
