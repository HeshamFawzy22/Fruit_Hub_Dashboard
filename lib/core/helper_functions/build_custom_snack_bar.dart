import 'package:flutter/material.dart';

void buildCustomSnackBar(
    BuildContext context, String message, MaterialColor color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: color,
    ),
  );
}
