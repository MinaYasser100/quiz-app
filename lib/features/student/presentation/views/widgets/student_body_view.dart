import 'package:flutter/material.dart';
import 'package:quiz_app/core/widgets/custom_button_widget.dart';
import 'package:quiz_app/features/toggle/data/model/question_model.dart';

import 'custom_quiz_questions_sliver_list.dart';

class StudentBodyView extends StatelessWidget {
  const StudentBodyView({super.key, required this.questions});
  final List<QuestionModel> questions;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomQuizQuestionsSliverList(
          questions: questions,
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              CustomButtonWidget(
                text: 'Submit',
                onPressed: () {},
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}
