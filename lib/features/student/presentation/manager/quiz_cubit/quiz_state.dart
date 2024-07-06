part of 'quiz_cubit.dart';

class QuizState {}

final class QuizInitial extends QuizState {}

final class QuizLoaded extends QuizState {
  final List<QuestionModel> questions;
  final Map<int, int> selectedAnswers;

  QuizLoaded({
    required this.questions,
    required this.selectedAnswers,
  });

  QuizLoaded copyWith({
    List<QuestionModel>? questions,
    Map<int, int>? selectedAnswers,
  }) {
    return QuizLoaded(
      questions: questions ?? this.questions,
      selectedAnswers: selectedAnswers ?? this.selectedAnswers,
    );
  }
}
