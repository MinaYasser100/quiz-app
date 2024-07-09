import 'package:flutter/material.dart';
import 'package:quiz_app/core/constant/app_color.dart';

import 'custom_review_answer_widget.dart';
import 'custom_review_question_section_widget.dart';

class CustomReviewQuestionWidget extends StatelessWidget {
  const CustomReviewQuestionWidget({
    super.key,
    required this.question,
    required this.answers,
    required this.correctAnswer,
    required this.studentAnswer,
  });
  final String question;
  final List<String> answers;
  final int correctAnswer;
  final int studentAnswer;

  int getEffectiveAnswerLength(List<String?> answers) {
    return answers
        .where((answer) => answer != null && answer.isNotEmpty)
        .length;
  }

  @override
  Widget build(BuildContext context) {
    answers.where((answer) => answer != '' && answer.isNotEmpty).toList();
    int effectiveLength = getEffectiveAnswerLength(answers);
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
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomReviewQuestionSectionWidget(question: question),
          const Text('Answer'),
          const SizedBox(
            height: 10,
          ),
          for (int i = 0; i < 4; i++)
            if (answers[i] != '')
              CustomReviewAnswerWidget(
                answerText: answers[i],
                isLast: i == effectiveLength - 1,
                isSelect: i == studentAnswer,
                falseAnswer: (i == studentAnswer)
                    ? correctAnswer != studentAnswer
                        ? true
                        : false
                    : false,
                isCorrect: (i == studentAnswer)
                    ? studentAnswer == correctAnswer
                        ? true
                        : false
                    : false,
              ),
          const SizedBox(
            height: 10,
          ),
          if (correctAnswer != studentAnswer) const Text('Correct Answer'),
          if (correctAnswer != studentAnswer)
            const SizedBox(
              height: 10,
            ),
          if (correctAnswer != studentAnswer)
            CustomReviewAnswerWidget(
              isLast: true,
              answerText: answers[correctAnswer],
              isCorrect: true,
            ),
        ],
      ),
    );
  }
}
