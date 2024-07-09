import 'package:flutter/material.dart';
import 'package:quiz_app/features/quiz_results/presentation/views/widgets/quiz_results_body_view.dart';

class QuizResultsView extends StatelessWidget {
  const QuizResultsView({super.key, required this.quizCode});
  final String quizCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Students\'s Results',
        ),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: const QuizResultBodyView(),
    );
  }
}
