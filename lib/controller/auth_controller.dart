import 'dart:io';

import 'package:hive/hive.dart';
import 'package:get/get.dart';
import '../models/auth_model/auth_model.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {
  XFile? pickedFile;
  String? imageURL;
  final Box _authBox = Hive.box<AuthModel>('AuthBox');
  Box get authBox => _authBox;
  createUser({required AuthModel auth}) {
    _authBox.add(auth);
    update();
  }

  // A C C E S S    I M A G E
  Future<XFile> getImag(bool isCamera) async {
    final picker = ImagePicker();
    if (isCamera) {
      pickedFile = await picker.pickImage(source: ImageSource.camera);
    } else {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    }
    // if (pickedFile != null) {
    //   file = File(pickedFile!.path);
    //   update();
    // }
    update();
    return pickedFile!;
    // file = File(pickedFile!.path);
    //   update();
    //   return file!;
  }

  updateUser({required int index, required AuthModel auth}) {
    _authBox.putAt(index, auth);
    update();
  }

  deleteUser({required int index}) {
    _authBox.deleteAt(index);
    update();
  }
}
