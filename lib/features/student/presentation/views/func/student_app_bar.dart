import 'package:flutter/material.dart';
import 'package:quiz_app/core/constant/app_color.dart';

AppBar studentAppBar() {
  return AppBar(
    foregroundColor: AppColor.primaryColor,
    title: const Text(
      'Quiz',
      style: TextStyle(
        fontWeight: FontWeight.w600,
      ),
    ),
    centerTitle: true,
    shadowColor: AppColor.primaryColor,
    elevation: 0.7,
  );
}
