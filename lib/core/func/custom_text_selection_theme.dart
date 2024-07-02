import 'package:flutter/material.dart';
import 'package:quiz_app/core/constant/app_color.dart';

TextSelectionThemeData customTextSelectionTheme() {
  return const TextSelectionThemeData(
      cursorColor: AppColor.secondColor,
      selectionColor: AppColor.secondColor,
      selectionHandleColor: AppColor.secondColor);
}
