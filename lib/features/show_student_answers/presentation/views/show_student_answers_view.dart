import 'package:flutter/material.dart';
import 'package:quiz_app/features/show_student_answers/presentation/views/widgets/show_student_answers_body_view.dart';
import 'package:quiz_app/features/student/data/model/student_response_model.dart';

class ShowStudentAnswersView extends StatelessWidget {
  const ShowStudentAnswersView({super.key, required this.studentResponseModel});
  final StudentResponseModel studentResponseModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            studentResponseModel.name,
          ),
        ),
      ),
      body: ShowStudentAnswersBodyView(
        studentResponseModel: studentResponseModel,
      ),
    );
  }
}
