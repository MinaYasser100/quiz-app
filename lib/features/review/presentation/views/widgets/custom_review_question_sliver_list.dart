import 'package:flutter/material.dart';
import 'package:quiz_app/features/student/data/model/student_response_model.dart';

import 'custom_review_question_widget.dart';

class CustomReviewQuestionSliverList extends StatelessWidget {
  const CustomReviewQuestionSliverList({
    super.key,
    required this.studentResponseModel,
  });

  final StudentResponseModel studentResponseModel;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: CustomReviewQuestionWidget(
              question: studentResponseModel.questions[index].question,
              answers: studentResponseModel.questions[index].answers,
              correctAnswer:
                  studentResponseModel.questions[index].correctAnswer,
              studentAnswer: studentResponseModel.selectedAnswers[index]!,
            )),
        childCount: studentResponseModel.questions.length,
      ),
    );
  }
}
