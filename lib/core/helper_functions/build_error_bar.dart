import 'package:flutter/material.dart';

void showBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: Duration(seconds: 1),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
