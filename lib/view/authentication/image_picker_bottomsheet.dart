import 'package:expense_tracker/constatnts/colors.dart';
import 'package:expense_tracker/constatnts/custom_widgets/common/sizedbox.dart';
import 'package:expense_tracker/controller/authentication_section/auth_controller.dart';
import 'package:expense_tracker/view/transaction/screens/history_screen/bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

AuthController authController = Get.put(AuthController());

XFile? image;
cameraOrGallery(String title) {
  Get.bottomSheet(
    backgroundColor: Appcolor.tertiaryColor,
    Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
      child: Column(
        children: [
          BottomsheetAppbar(title: title),
          const BlankSpace(
            height: 20,
          ),
          Container(
            color: Appcolor.white,
            child: Wrap(
              children: [
                ListTile(
                  onTap: () async {
                    image = await authController.getImag(true);
                    Get.back();
                  },
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('Camera'),
                ),
                ListTile(
                  onTap: () async {
                    image = await authController.getImag(false);
                    Get.back();
                  },
                  leading: const Icon(Icons.photo),
                  title: const Text('Gallery'),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
