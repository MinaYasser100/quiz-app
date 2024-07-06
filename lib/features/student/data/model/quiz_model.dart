import 'package:quiz_app/features/toggle/data/model/question_model.dart';

class QuizModel {
  final List<QuestionModel> questions;
  final Map<int, int> selectedAnswers;

  QuizModel({
    required this.questions,
    required this.selectedAnswers,
  });

  QuizModel copyWith(
      {List<QuestionModel>? questions, Map<int, int>? selectedAnswers}) {
    return QuizModel(
        questions: questions ?? this.questions,
        selectedAnswers: selectedAnswers ?? this.selectedAnswers);
  }
}
