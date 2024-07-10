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
        return const Column(
          children: [
            StudentResultListViewTeacher(),
          ],
        );
      },
    );
  }
}
