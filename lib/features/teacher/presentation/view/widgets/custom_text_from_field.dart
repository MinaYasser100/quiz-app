import 'package:flutter/material.dart';

import '../func/custom_underline_input_border.dart';

class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField({
    super.key,
    required this.controller,
    required this.color,
    this.validator,
    this.labelText,
    this.keyboardType = TextInputType.text,
  });
  final TextEditingController controller;
  final Color color;
  final String? Function(String?)? validator;
  final String? labelText;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enableInteractiveSelection: true,
      keyboardType: keyboardType,
      validator: validator,
      cursorColor: color,
      decoration: InputDecoration(
        labelText: labelText,
        border: customUnderlineInputBorder(color: color),
        focusedBorder: customUnderlineInputBorder(color: color),
        enabledBorder: customUnderlineInputBorder(color: color),
      ),
    );
  }
}
