part of 'all_quizs_cubit.dart';

@immutable
sealed class AllQuizsState {}

final class AllQuizsInitial extends AllQuizsState {}

final class AllQuizsGetQuizIdsHiveLoading extends AllQuizsState {}

final class AllQuizsGetQuizIdsHiveSuccess extends AllQuizsState {
  final List<String> quizIds;

  AllQuizsGetQuizIdsHiveSuccess({required this.quizIds});
}

final class AllQuizsGetQuizIdsHiveFailure extends AllQuizsState {
  final String error;

  AllQuizsGetQuizIdsHiveFailure({required this.error});
}