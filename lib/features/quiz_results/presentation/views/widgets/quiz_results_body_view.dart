import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/features/quiz_results/presentation/manager/cubit/students_results_cubit.dart';

import 'student_result_list_view_teacher.dart';

class QuizResultBodyView extends StatelessWidget {
  const QuizResultBodyView({super.key, required this.quizCode});
  final String quizCode;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsResultsCubit, StudentsResultsState>(
      builder: (context, state) {
        if (state is StudentsResultsLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        } else if (state is StudentsResultsSuccess) {
          return Column(
            children: [
              StudentResultListViewTeacher(
                studentResponseModel: state.studentResponses,
              ),
            ],
          );
        } else {
          return const Center(
            child: Text(
              'An Error ocurred while downloading',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
          );
        }
      },
    );
  }
}
