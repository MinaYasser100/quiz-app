import 'package:flutter/material.dart';
import 'package:quiz_app/features/student/data/model/student_response_model.dart';

import 'student_result_for_teacher.dart';

class StudentResultListViewTeacher extends StatelessWidget {
  const StudentResultListViewTeacher({
    super.key,
    required this.studentResponseModel,
  });
  final List<StudentResponseModel> studentResponseModel;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => StudentResultForTeacher(
          studentResponseModel: studentResponseModel[index],
        ),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: studentResponseModel.length,
      ),
    );
  }
}
