import 'package:flutter/material.dart';
import 'package:quiz_app/core/constant/app_color.dart';
import 'package:quiz_app/features/review/presentation/views/review_student_answers_view.dart';
import 'package:quiz_app/features/student/data/model/student_response_model.dart';

class ResultShowDialogContent extends StatelessWidget {
  const ResultShowDialogContent({
    super.key,
    required this.result,
    required this.questionsLength,
    required this.studentResponseModel,
  });
  final int result;
  final int questionsLength;
  final StudentResponseModel studentResponseModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Your Result',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.primaryColor),
          child: Column(
            children: [
              Text(
                result.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                height: 1,
                width: 100,
                color: Colors.black,
              ),
              Text(
                questionsLength.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => ReviewStudentAnswersView(
                    studentResponseModel: studentResponseModel),
              ),
              (route) => false,
            );
          },
          child: const Text(
            'Review your answers',
            style: TextStyle(
              color: AppColor.primaryColor,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
