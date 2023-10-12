import 'package:expense_tracker/models/auth_model/auth_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AuthRepository {
  static const String boxname = 'AuthBox';
  static openBox() async => await Hive.openBox<AuthModel>(boxname);
  static Box getBox() => Hive.box<AuthModel>(boxname);
  static closeBox() async => await Hive.box(boxname).close();
}
