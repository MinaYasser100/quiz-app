import 'package:flutter/material.dart';
import 'package:quiz_app/core/constant/app_color.dart';

UnderlineInputBorder customUnderlineInputBorder() {
  return const UnderlineInputBorder(
    borderSide: BorderSide(
      color: AppColor.secondColor,
    ), // Specify border color here
  );
}
