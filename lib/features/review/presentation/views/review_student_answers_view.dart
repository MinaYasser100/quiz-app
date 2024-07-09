import 'package:flutter/material.dart';
import 'package:quiz_app/features/student/data/model/student_response_model.dart';

import 'widgets/review_student_answers_body_view.dart';

class ReviewStudentAnswersView extends StatelessWidget {
  const ReviewStudentAnswersView(
      {super.key, required this.studentResponseModel});
  final StudentResponseModel studentResponseModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Review Your Answers',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: ReviewStudentAnswersBodyView(
        studentResponseModel: studentResponseModel,
      ),
    );
  }
}
