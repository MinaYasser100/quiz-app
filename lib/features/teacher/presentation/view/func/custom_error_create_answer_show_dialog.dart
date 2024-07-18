import 'package:flutter/material.dart';
import 'package:quiz_app/core/widgets/custom_action_text_button.dart';

Future<dynamic> customErrorCreateAnswerShowDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => const AlertDialog(
      title: Text('Error'),
      content: Text('Each question must have at least two answers.'),
      actions: [
        CustomActionTextButton(),
      ],
    ),
  );
}
