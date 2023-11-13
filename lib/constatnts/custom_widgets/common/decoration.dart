import 'package:flutter/material.dart';

ShapeDecoration backgroundCurveDecoration({required Color color}) {
  return ShapeDecoration(
    color: color,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
    ),
  );
}

ShapeDecoration cardDecoration({required Color color}) {
  return ShapeDecoration(
    color: color,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  );
}
