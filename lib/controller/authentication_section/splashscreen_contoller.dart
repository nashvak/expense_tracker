import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:expense_tracker/view/authentication/get_started.dart';
import 'package:expense_tracker/view/home_screen/widgets/bottom_nav.dart';
import 'dart:async';

class SplashScreenContoller extends GetxController {
  String keyToLogin = "";
  void checkScreen(ctx) async {
    var pref = await SharedPreferences.getInstance();
    var isLoggedIn = pref.getBool(keyToLogin);

    Timer(const Duration(seconds: 2), () {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Get.offAll(() => const BottomNav());
        } else {
          Get.off(() => const GetStartedScreen());
        }
      } else {
        Get.off(() => const GetStartedScreen());
      }
    });
  }
}
