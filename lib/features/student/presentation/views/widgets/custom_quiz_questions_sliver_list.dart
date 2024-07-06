import 'package:flutter/material.dart';
import 'package:quiz_app/features/toggle/data/model/question_model.dart';

import 'custom_student_question_item_widget.dart';

class CustomQuizQuestionsSliverList extends StatelessWidget {
  const CustomQuizQuestionsSliverList({
    super.key,
    required this.questions,
  });
  final List<QuestionModel> questions;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomStudentQuestionItemWidget(
            question: questions[index],
            questionIdex: index,
          ),
        ),
        childCount: questions.length,
      ),
    );
  }
}
