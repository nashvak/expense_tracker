import 'package:flutter/material.dart';

TextStyle textFieldtitle() {
  return const TextStyle(
    fontSize: 16,
    //fontWeight: FontWeight.bold,
  );
}

TextStyle heading(
    {Color textColor = Colors.white,
    FontWeight weight = FontWeight.bold,
    double size = 14}) {
  return TextStyle(
    fontWeight: weight,
    color: textColor,
    fontSize: size,
  );
}

TextStyle screenTitleText() {
  return const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: 25,
  );
}
