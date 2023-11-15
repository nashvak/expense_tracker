import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// var successSnackbar = SnackBar(
//   backgroundColor: Colors.green,
//   behavior: SnackBarBehavior.floating,
//   elevation: 0,
//   margin: EdgeInsets.all(10),
//   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//   duration: Duration(seconds: 2),
//   content: Wrap(
//     children: [
//       Center(
//         child: Text('Transaction added succesfully'),
//       ),
//     ],
//   ),
// );
// var editSnackbar = const SnackBar(
//   backgroundColor: Colors.green,
//   duration: Duration(seconds: 1),
//   content: Text('Transaction edit succesfully'),
// );
// var deleteSnackbar = const SnackBar(
//   backgroundColor: Colors.red,
//   duration: Duration(seconds: 1),
//   content: Text('Transaction deleted succesfully'),
// );

// //

// //
// snackBarMsg() {
//   final sb = SnackBar(
//     elevation: 0.0,
//     margin: EdgeInsets.symmetric(horizontal: 5, vertical: 20),

//     behavior: SnackBarBehavior.floating,
//     content:
//         Container(child: Center(child: Text('Transaction added succesfully'))),
//     duration: const Duration(seconds: 1),
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

//     //backgroundColor: Colors.redAccent,
//     action: SnackBarAction(
//       textColor: const Color(0xFFFAF2FB),
//       label: 'OK',
//       onPressed: () {},
//     ),
//   );
//   snackbarKey.currentState?.showSnackBar(sb);
// }

// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

showCustomToast() {
  Fluttertoast.showToast(
      msg: "This is Center Short Toast",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

class ToastUtil {
  static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
