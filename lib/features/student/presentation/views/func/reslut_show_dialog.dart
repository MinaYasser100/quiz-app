import 'package:flutter/material.dart';
import 'package:quiz_app/features/student/data/model/student_response_model.dart';
import 'package:quiz_app/features/toggle/presentation/views/toggle_view.dart';

import '../widgets/result_show_dialog_content.dart';

Future<dynamic> resultShowDialog({
  required BuildContext context,
  required int questionsLength,
  required int result,
  required StudentResponseModel studentResponseModel,
}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text(
        'Thank You',
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      content: ResultShowDialogContent(
        questionsLength: questionsLength,
        result: result,
        studentResponseModel: studentResponseModel,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const ToggleView(),
              ),
              (route) => false,
            );
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    ),
  );
}
