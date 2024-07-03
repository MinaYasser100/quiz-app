import 'package:flutter/material.dart';
import 'package:quiz_app/core/constant/app_color.dart';

import '../func/custom_underline_input_border.dart';

class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enableInteractiveSelection: true,
      cursorColor: AppColor.secondColor,
      decoration: InputDecoration(
        border: customUnderlineInputBorder(),
        focusedBorder: customUnderlineInputBorder(),
        enabledBorder: customUnderlineInputBorder(),
      ),
    );
  }
}
