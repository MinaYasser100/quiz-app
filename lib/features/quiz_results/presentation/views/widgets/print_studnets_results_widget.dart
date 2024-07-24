import 'package:flutter/material.dart';
import 'package:quiz_app/core/constant/app_color.dart';
import 'package:quiz_app/core/styles/styles.dart';
import 'package:quiz_app/features/quiz_results/presentation/views/pdf/func/pdf_func.dart';
import 'package:quiz_app/features/student/data/model/student_response_model.dart';

class PrintStudentsResultsWidget extends StatelessWidget {
  const PrintStudentsResultsWidget({
    super.key,
    required this.studentResponses,
  });
  final List<StudentResponseModel> studentResponses;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Container(
          height: 50,
          width: 200,
          decoration: BoxDecoration(
            color: AppColor.secondColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: MaterialButton(
            onPressed: () {
              printStudentDegres(
                studentResponses: studentResponses,
                context: context,
              );
            },
            child: Text(
              'Print',
              style: Styles.textStyle20,
            ),
          ),
        ),
      ],
    );
  }
}
