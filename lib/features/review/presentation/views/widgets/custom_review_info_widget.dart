import 'package:flutter/material.dart';

import '../../../../student/data/model/student_response_model.dart';

class CustomReviewInfoWidget extends StatelessWidget {
  const CustomReviewInfoWidget({
    super.key,
    required this.studentResponseModel,
    this.isTeacher = false,
  });
  final bool isTeacher;
  final StudentResponseModel studentResponseModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(isTeacher ? 'Student Name : ' : 'Your Name : '),
          const SizedBox(
            height: 10,
          ),
          Text(
            studentResponseModel.name,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(isTeacher ? 'Student Section : ' : 'Your Section : '),
          const SizedBox(
            height: 10,
          ),
          Text(
            studentResponseModel.section,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          Text(isTeacher ? 'Student Result : ' : 'Your Result : '),
          const SizedBox(
            height: 10,
          ),
          Text(
            '${studentResponseModel.result} / ${studentResponseModel.questions.length}',
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
