part of 'add_new_question_cubit.dart';

abstract class AddNewQuestionStates {}

final class AddNewQuestionInitial extends AddNewQuestionStates {}

final class AddNewQuestionCubitLoaded extends AddNewQuestionStates {
  final List<Widget> questions;

  AddNewQuestionCubitLoaded(this.questions);
}
