import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_text_styles.dart';

AppBar buildAppBar(BuildContext context, String title) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        title,
        style: TextStyles.bold19.copyWith(color: Colors.black),
      ),
    );
  }