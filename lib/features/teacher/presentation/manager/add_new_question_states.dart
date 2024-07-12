part of 'add_new_question_cubit.dart';

abstract class AddNewQuestionStates {}

final class AddNewQuestionInitial extends AddNewQuestionStates {}

final class AddNewQuestionCubitLoaded extends AddNewQuestionStates {
  final List<CustomQuestionWidget> questions;
  final bool isLoading;

  AddNewQuestionCubitLoaded(this.questions, {required this.isLoading});
}
