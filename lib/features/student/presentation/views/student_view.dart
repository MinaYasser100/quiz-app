import 'package:flutter/material.dart';
import 'package:quiz_app/features/student/data/model/quiz_model.dart';
import 'package:quiz_app/features/student/presentation/views/widgets/student_body_view.dart';

import 'func/student_app_bar.dart';

class StudentView extends StatelessWidget {
  const StudentView(
      {super.key, required this.quizCode, required this.quizModel});
  final String quizCode;
  final QuizModel quizModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: studentAppBar(
        title: quizModel.title,
      ),
      body: StudentBodyView(
        quizCode: quizCode,
        questions: quizModel.questions,
      ),
    );
  }
}
