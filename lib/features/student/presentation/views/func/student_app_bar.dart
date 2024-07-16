import 'package:flutter/material.dart';
import 'package:quiz_app/core/constant/app_color.dart';

AppBar studentAppBar({required String title}) {
  return AppBar(
    foregroundColor: AppColor.primaryColor,
    title: Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
      ),
    ),
    centerTitle: true,
    shadowColor: AppColor.primaryColor,
    elevation: 0.7,
  );
}
