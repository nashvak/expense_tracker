import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

var successSnackbar = SnackBar(
  elevation: 0,
  duration: const Duration(seconds: 2),
  backgroundColor: Colors.transparent,
  showCloseIcon: false,
  behavior: SnackBarBehavior.fixed,
  content: AwesomeSnackbarContent(
      title: 'Success',
      message: 'Transaction added succesfully',
      contentType: ContentType.success),
);

var editSnackbar = SnackBar(
  elevation: 0,
  duration: const Duration(seconds: 2),
  backgroundColor: Colors.transparent,
  showCloseIcon: false,
  behavior: SnackBarBehavior.fixed,
  content: AwesomeSnackbarContent(
      title: 'Success',
      message: 'Transaction edited succesfully',
      contentType: ContentType.success),
);
var deleteTransactionSnackbar = SnackBar(
  elevation: 0,
  behavior: SnackBarBehavior.fixed,
  duration: const Duration(seconds: 2),
  backgroundColor: Colors.transparent,
  showCloseIcon: false,
  content: AwesomeSnackbarContent(
      title: 'Success',
      message: 'Transaction deleted succesfully',
      contentType: ContentType.failure),
);
// var editSnackbar = SnackBar(
//   elevation: 0,
//   content: AwesomeSnackbarContent(
//       title: 'Success',
//       message: 'Transaction edited succesfully',
//       contentType: ContentType.help),
// );
