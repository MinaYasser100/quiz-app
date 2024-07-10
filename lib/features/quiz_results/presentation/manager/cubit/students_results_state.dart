part of 'students_results_cubit.dart';

@immutable
sealed class StudentsResultsState {}

final class StudentsResultsInitial extends StudentsResultsState {}

class StudentsResultsLoading extends StudentsResultsState {}

class StudentsResultsSuccess extends StudentsResultsState {
  final List<StudentResponseModel> studentResponses;

  StudentsResultsSuccess(this.studentResponses);
}

class StudentsResultsError extends StudentsResultsState {
  final String errorMessage;

  StudentsResultsError(this.errorMessage);
}
