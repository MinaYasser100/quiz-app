import 'package:flutter/material.dart';
import 'package:quiz_app/features/toggle/presentation/views/toggle_view.dart';

void navigationToToggleView(BuildContext context) {
  Future.delayed(const Duration(seconds: 7), () {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const ToggleView()),
    );
  });
}
