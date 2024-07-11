part of 'students_results_cubit.dart';

@immutable
sealed class StudentsResultsState {}

final class StudentsResultsInitial extends StudentsResultsState {}

class StudentsResultsLoading extends StudentsResultsState {}

class StudentsResultsSuccess extends StudentsResultsState {
  final List<StudentResponseModel> studentResponses;

  StudentsResultsSuccess({required this.studentResponses});
}

class StudentsResultsError extends StudentsResultsState {
  final String errorMessage;

  StudentsResultsError({required this.errorMessage});
}
