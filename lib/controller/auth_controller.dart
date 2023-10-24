import 'package:hive/hive.dart';
import 'package:get/get.dart';
import '../models/auth_model/auth_model.dart';

class AuthController extends GetxController {
  final Box _authBox = Hive.box<AuthModel>('AuthBox');
  Box get authBox => _authBox;
  createUser({required AuthModel auth}) {
    _authBox.add(auth);
    update();
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
