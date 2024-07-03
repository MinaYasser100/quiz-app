import 'package:flutter/material.dart';

Future<dynamic> customErrorCreateAnswerShowDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Error'),
      content: const Text('Each question must have at least two answers.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
