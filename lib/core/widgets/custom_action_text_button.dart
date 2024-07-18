import 'package:flutter/material.dart';

class CustomActionTextButton extends StatelessWidget {
  const CustomActionTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text('OK'),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
