import 'package:flutter/material.dart';
import 'package:quiz_app/features/student/data/model/student_response_model.dart';

class StudentResultForTeacher extends StatelessWidget {
  const StudentResultForTeacher({
    super.key,
    required this.studentResponseModel,
  });
  final StudentResponseModel studentResponseModel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.bookmark_sharp,
        size: 30,
        color: Colors.lime,
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
    );
  }
}
