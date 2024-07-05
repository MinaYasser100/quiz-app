part of 'student_cubit.dart';

@immutable
sealed class StudentState {}

final class StudentInitial extends StudentState {}

final class StudentCubitGetQuizQuestionsLoading extends StudentState {}

final class StudentCubitGetQuizQuestionsSuccess extends StudentState {
  final List<QuestionModel> questions;

  StudentCubitGetQuizQuestionsSuccess({required this.questions});
}

final class StudentCubitGetQuizQuestionsFailure extends StudentState {
  final String error;

  StudentCubitGetQuizQuestionsFailure({required this.error});
}
