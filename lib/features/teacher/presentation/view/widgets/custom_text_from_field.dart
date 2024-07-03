import 'package:flutter/material.dart';

import '../func/custom_underline_input_border.dart';

class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField({
    super.key,
    required this.controller,
    required this.color,
  });
  final TextEditingController controller;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enableInteractiveSelection: true,
      cursorColor: color,
      decoration: InputDecoration(
        border: customUnderlineInputBorder(color: color),
        focusedBorder: customUnderlineInputBorder(color: color),
        enabledBorder: customUnderlineInputBorder(color: color),
      ),
    );
  }
}
