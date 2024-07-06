import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/widgets/custom_button_widget.dart';
import 'package:quiz_app/features/student/presentation/manager/quiz_cubit/quiz_cubit.dart';
import 'package:quiz_app/features/toggle/data/model/question_model.dart';

import 'custom_quiz_questions_sliver_list.dart';

class StudentBodyView extends StatelessWidget {
  const StudentBodyView({super.key, required this.questions});
  final List<QuestionModel> questions;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizCubit(questions),
      child: CustomScrollView(
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
      ),
    );
  }
}
