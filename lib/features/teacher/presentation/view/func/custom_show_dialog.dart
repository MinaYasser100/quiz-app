import 'package:flutter/material.dart';
import 'package:quiz_app/core/widgets/custom_action_text_button.dart';

Future<dynamic> customShowDialog({
  required BuildContext context,
  required String title,
  required String contentText,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(contentText),
        actions: const <Widget>[
          CustomActionTextButton(),
        ],
      );
    },
  );
}
