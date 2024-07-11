import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/quiz_results_repo/quiz_results_impl_repo.dart';
import '../manager/cubit/students_results_cubit.dart';
import 'widgets/number_of_students_results.dart';
import 'widgets/quiz_results_body_view.dart';

class QuizResultsView extends StatelessWidget {
  const QuizResultsView({super.key, required this.quizCode});
  final String quizCode;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StudentsResultsCubit(QuizResultsImplRepo())
        ..fetchStudentResponsesFirebase(quizCode: quizCode),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Students\'s Results',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          elevation: 0.5,
          actions: const [
            NumberOfStudentsResults(),
          ],
        ),
        body: QuizResultBodyView(
          quizCode: quizCode,
        ),
      ),
    );
  }
}
