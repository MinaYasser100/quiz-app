import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/features/student/presentation/manager/quiz_cubit/quiz_cubit.dart';
import 'package:quiz_app/features/toggle/data/model/question_model.dart';

import 'custom_quiz_questions_sliver_list.dart';
import 'custom_student_info_view_widget.dart';
import 'custom_student_submit_widget.dart';

class StudentBodyView extends StatefulWidget {
  const StudentBodyView(
      {super.key, required this.questions, required this.quizCode});
  final List<QuestionModel> questions;
  final String quizCode;
  @override
  State<StudentBodyView> createState() => _StudentBodyViewState();
}

class _StudentBodyViewState extends State<StudentBodyView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController sectionController = TextEditingController();
  GlobalKey<FormState> infoKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizCubit(widget.questions),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: BlocBuilder<QuizCubit, QuizState>(
                builder: (context, state) {
                  return CustomStudentInfoViewWidget(
                    infoKey: infoKey,
                    nameController: nameController,
                    sectionController: sectionController,
                  );
                },
              ),
            ),
          ),
          CustomQuizQuestionsSliverList(
            questions: widget.questions,
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: CustomStudentSubmitWidget(
              infoKey: infoKey,
              widget: widget,
              nameController: nameController,
              sectionController: sectionController,
            ),
          ),
        ],
      ),
    );
  }
}
