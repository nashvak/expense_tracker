import 'package:expense_tracker/controller/transaction_contollers/transaction_controller.dart';
import 'package:hive/hive.dart';
import 'package:get/get.dart';
import 'package:async/async.dart';
import '../../models/auth_model/auth_model.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {
  TransactionController transactionController = TransactionController();
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

    update();
    return pickedFile!;
  }

  updateUser({required int index, required AuthModel auth}) {
    _authBox.putAt(index, auth);
    update();
  }

  deleteUser({required int index}) {
    _authBox.deleteAt(index);
    update();
  }

//enable or disable save button
  var nameButton = true;
  var emailButton = true;

  void nameButtonStatus(String text) {
    nameButton = text.isNotEmpty;
    // print(nameButton);
    update();
  }

  void emailButtonStatus(String text) {
    emailButton = text.isNotEmpty;
    // print(nameButton);
    update();
  }

  // F U N C T I O N   T O   L O G O U T
  logoutProfile() {
    transactionController.transactionBox.clear();
    transactionController.sortedList.clear();
  }
}
