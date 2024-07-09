import 'package:flutter/material.dart';
import 'package:quiz_app/core/constant/app_color.dart';

class CustomReviewAnswerWidget extends StatelessWidget {
  const CustomReviewAnswerWidget({
    super.key,
    required this.isLast,
    required this.answerText,
    this.isSelect = false,
    required this.isCorrect,
    this.falseAnswer = false,
  });
  final bool isLast;
  final String answerText;
  final bool isSelect;
  final bool isCorrect;
  final bool falseAnswer;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              if (!isCorrect)
                Icon(
                  isSelect
                      ? Icons.radio_button_checked
                      : Icons.radio_button_unchecked,
                  color: falseAnswer ? Colors.red : AppColor.primaryColor,
                ),
              if (isCorrect)
                const Icon(
                  Icons.radio_button_checked,
                  color: Colors.green,
                ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  answerText,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: falseAnswer
                      ? const TextStyle(color: Colors.red)
                      : TextStyle(
                          color: isCorrect ? Colors.green : Colors.black,
                        ),
                ),
              ),
            ],
          ),
        ),
        if (!isLast)
          Divider(
            color: Colors.grey[300],
          )
      ],
    );
  }
}
