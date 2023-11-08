import 'dart:io';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';

var assetImageUrl = 'images/user-logo.png';

class SignupController extends GetxController {
  Future<String> copyAssetImageToLocalFile() async {
    final ByteData assetImageByteData = await rootBundle.load(assetImageUrl);
    final Uint8List assetImageBytes = assetImageByteData.buffer.asUint8List();

    final appDir = await getTemporaryDirectory();
    final localImagePath = '${appDir.path}/${assetImageUrl.split('/').last}';

    final imageFile = File(localImagePath);
    await imageFile.writeAsBytes(assetImageBytes);

    return localImagePath;
  }
}
