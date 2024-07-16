part of 'student_cubit.dart';

@immutable
sealed class StudentState {}

final class StudentInitial extends StudentState {}

final class StudentCubitGetQuizQuestionsLoading extends StudentState {}

final class StudentCubitGetQuizQuestionsSuccess extends StudentState {
  final QuizModel quizModel;

  StudentCubitGetQuizQuestionsSuccess({required this.quizModel});
}

final class StudentCubitGetQuizQuestionsFailure extends StudentState {
  final String error;

  StudentCubitGetQuizQuestionsFailure({required this.error});
}
