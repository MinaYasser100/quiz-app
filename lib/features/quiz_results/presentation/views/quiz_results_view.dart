import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/features/quiz_results/data/quiz_results_repo/quiz_results_impl_repo.dart';
import 'package:quiz_app/features/quiz_results/presentation/manager/cubit/students_results_cubit.dart';
import 'package:quiz_app/features/quiz_results/presentation/views/widgets/quiz_results_body_view.dart';

class QuizResultsView extends StatelessWidget {
  const QuizResultsView({super.key, required this.quizCode});
  final String quizCode;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StudentsResultsCubit(QuizResultsImplRepo()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Students\'s Results',
          ),
          centerTitle: true,
          elevation: 0.5,
        ),
        body: QuizResultBodyView(
          quizCode: quizCode,
        ),
      ),
    );
  }
}
