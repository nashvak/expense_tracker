import 'package:get/get.dart';

class PasswordController extends GetxController {
  RxBool visibility = true.obs;
  void changeVisibility(bool value) {
    visibility.value = !visibility.value;
  }
}
