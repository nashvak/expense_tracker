import 'package:flutter/material.dart';

var successSnackbar = const SnackBar(
    backgroundColor: Colors.green,
    duration: Duration(seconds: 1),
    content: Text('Transaction added succesfully'));
var editSnackbar = const SnackBar(
    backgroundColor: Colors.green,
    duration: Duration(seconds: 1),
    content: Text('Transaction edit succesfully'));
var deleteSnackbar = const SnackBar(
    backgroundColor: Colors.red,
    duration: Duration(seconds: 1),
    content: Text('Transaction deleted succesfully'));
