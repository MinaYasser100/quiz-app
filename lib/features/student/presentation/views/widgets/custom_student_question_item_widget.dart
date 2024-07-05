import 'package:flutter/material.dart';
import 'package:quiz_app/core/constant/app_color.dart';
import 'package:quiz_app/features/toggle/data/model/question_model.dart';

import 'custom_student_answer_widget.dart';

class CustomStudentQuestionItemWidget extends StatelessWidget {
  const CustomStudentQuestionItemWidget({
    super.key,
    required this.question,
  });

  final QuestionModel question;
  int getEffectiveAnswerLength(List<String?> answers) {
    return answers
        .where((answer) => answer != null && answer.isNotEmpty)
        .length;
  }

  @override
  Widget build(BuildContext context) {
    question.answers
        .where((answer) => answer != '' && answer.isNotEmpty)
        .toList();
    int effectiveLength = getEffectiveAnswerLength(question.answers);
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColor.primaryColor, // Border color
          width: 1.0, // Border width
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Question'),
          const SizedBox(
            height: 4,
          ),
          Text(
            question.question,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            color: AppColor.primaryColor,
          ),
          const Text('Answer'),
          const SizedBox(
            height: 10,
          ),
          for (int i = 0; i < question.answers.length; i++)
            if (question.answers[i] != '')
              CustomStudentAnswerWidget(
                answerText: question.answers[i],
                isLast: i == effectiveLength - 1,
              )
        ],
      ),
    );
  }
}
