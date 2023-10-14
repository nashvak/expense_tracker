import 'package:hive/hive.dart';
import 'package:get/get.dart';
import '../models/auth_model/auth_model.dart';
import '../repository/auth_repository.dart';

class AuthController extends GetxController {
  final Box _authBox = AuthRepository.getBox();
  Box get authBox => _authBox;
  createNote({required AuthModel auth}) {
    _authBox.add(auth);
    update();
  }

  updateNote({required int index, required AuthModel auth}) {
    _authBox.putAt(index, auth);
    update();
  }

  deleteNote({required int index}) {
    _authBox.deleteAt(index);
    update();
  }
}
