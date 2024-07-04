part of 'student_cubit.dart';

@immutable
sealed class StudentState {}

final class StudentInitial extends StudentState {}

final class StudentCubitGetQuizQuestionsLoading extends StudentState {}

final class StudentCubitGetQuizQuestionsSuccess extends StudentState {}

final class StudentCubitGetQuizQuestionsFailure extends StudentState {
  final String error;

  StudentCubitGetQuizQuestionsFailure({required this.error});
}
