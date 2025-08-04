  import 'package:flutter/material.dart';

void showImageError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('يرجى اختيار صورة للمنتج'),
      ),
    );
  }