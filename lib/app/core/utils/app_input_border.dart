import 'package:flutter/material.dart';

class AppInputBorder {
  static OutlineInputBorder custom(Color color, double width, {double radius = 7}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(
        style: BorderStyle.solid,
        color: color,
        width: width,
      ),
    );
  }
}