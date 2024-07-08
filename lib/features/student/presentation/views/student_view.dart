import 'package:flutter/material.dart';
import 'package:quiz_app/features/student/presentation/views/widgets/student_body_view.dart';
import 'package:quiz_app/features/toggle/data/model/question_model.dart';

import 'func/student_app_bar.dart';

class StudentView extends StatelessWidget {
  const StudentView(
      {super.key, required this.quizCode, required this.questions});
  final String quizCode;
  final List<QuestionModel> questions;
  @override
  Widget build(BuildContext context) {
    print('------------------------------------');
    print(quizCode);
    return Scaffold(
      appBar: studentAppBar(),
      body: StudentBodyView(
        quizCode: quizCode,
        questions: questions,
      ),
    );
  }
}
