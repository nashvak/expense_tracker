import 'package:get/get.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:expense_tracker/view/authentication/get_started.dart';
import 'package:expense_tracker/view/home_screen/widgets/bottom_nav.dart';
import 'dart:async';

class SplashScreenContoller extends GetxController {
  String keyToLogin = "";
  // bool? isFirstTime;
  void checkScreen(ctx) async {
    var pref = await SharedPreferences.getInstance();
    //to show the permission ,if first time show the permission otherwise not
    // isFirstTime = pref.getBool('isFirstTime') ?? true;
    //check already logged in or not
    var isLoggedIn = pref.getBool(keyToLogin);

    Timer(const Duration(seconds: 2), () async {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Get.offAll(() => const BottomNav());
        } else {
          Get.off(() => const GetStartedScreen());
        }
      } else {
        // var status = await Permission.notification.request();
        // if (status.isGranted) {
        //   await pref.setBool('isFirstTime', false);
        //   Get.off(() => const GetStartedScreen());
        // } else {
        //   Get.off(() => const GetStartedScreen());
        // }
        Get.off(() => const GetStartedScreen());
      }
    });
  }
}
