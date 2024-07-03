import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/core/constant/app_color.dart';

Future<dynamic> copyQuizIdShowDialog(BuildContext context, String quizID) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text(
        'Quiz ID',
      ),
      content: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              height: 30,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10)),
              child: FittedBox(
                child: Text(
                  quizID,
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: quizID));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('ID copied to clipboard')),
              );
            },
            child: const Text(
              'Copy',
              style: TextStyle(
                color: AppColor.secondColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
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
