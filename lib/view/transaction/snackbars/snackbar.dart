import 'package:flutter/material.dart';

var successSnackbar = const SnackBar(
    elevation: 0,
    duration: Duration(seconds: 2),
    backgroundColor: Colors.red,
    showCloseIcon: false,
    behavior: SnackBarBehavior.fixed,
    margin: EdgeInsets.all(20),
    content: Text('Transaction added succesfully'));
