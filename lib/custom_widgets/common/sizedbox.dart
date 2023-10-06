import 'package:flutter/material.dart';

Widget height30 = const SizedBox(
  height: 30,
);
Widget height10 = const SizedBox(
  height: 10,
);
Widget height20 = const SizedBox(
  height: 20,
);
Widget height40 = const SizedBox(
  height: 40,
);
Widget height50 = const SizedBox(
  height: 50,
);

TextStyle titleStyle() {
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
