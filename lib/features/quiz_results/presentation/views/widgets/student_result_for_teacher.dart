import 'package:flutter/material.dart';
import 'package:quiz_app/core/constant/app_color.dart';
import 'package:quiz_app/features/show_student_answers/presentation/views/show_student_answers_view.dart';
import 'package:quiz_app/features/student/data/model/student_response_model.dart';

class StudentResultForTeacher extends StatelessWidget {
  const StudentResultForTeacher({
    super.key,
    required this.studentResponseModel,
  });
  final StudentResponseModel studentResponseModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShowStudentAnswersView(
              studentResponseModel: studentResponseModel,
            ),
          ),
        );
      },
      child: ListTile(
        leading: const Icon(
          Icons.bookmark_sharp,
          size: 30,
          color: AppColor.secondColor,
        ),
        title: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.topLeft,
          child: Text(
            studentResponseModel.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        subtitle: Text(
          'Section : ${studentResponseModel.section}',
        ),
        trailing: Text(
          '${studentResponseModel.result} / ${studentResponseModel.questions.length}',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
