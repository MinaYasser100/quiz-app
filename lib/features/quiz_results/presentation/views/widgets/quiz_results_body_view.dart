import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/features/quiz_results/presentation/manager/cubit/students_results_cubit.dart';

import 'error_download_data.dart';
import 'print_studnets_results_widget.dart';
import 'student_result_list_view_teacher.dart';
import 'no_student_widget.dart';

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
          return CustomScrollView(
            slivers: [
              if (state.studentResponses.isNotEmpty)
                StudentResultListViewTeacher(
                  studentResponseModel: state.studentResponses,
                ),
              if (state.studentResponses.isNotEmpty)
                SliverToBoxAdapter(
                  child: PrintStudentsResultsWidget(
                    studentResponses: state.studentResponses,
                  ),
                ),
              if (state.studentResponses.isEmpty)
                const SliverToBoxAdapter(
                  child: NoStudentWidget(),
                ),
            ],
          );
        } else {
          return const ErrorDownloadData();
        }
      },
    );
  }
}

//if (state.studentResponses.isEmpty) const NoStudentWidget(),
