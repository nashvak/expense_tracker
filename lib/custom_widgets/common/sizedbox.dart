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

class BlankSpace extends StatelessWidget {
  BlankSpace({this.height, this.width, super.key});
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
