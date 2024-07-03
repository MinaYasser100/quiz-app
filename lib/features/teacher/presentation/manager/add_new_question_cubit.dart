import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/features/teacher/presentation/view/func/copy_quiz_id_show_dialog.dart';
import '../view/func/custom_error_create_answer_show_dialog.dart';
import '../view/widgets/custom_question_widget.dart';

part 'add_new_question_states.dart';

class AddNewQuestionCubit extends Cubit<AddNewQuestionStates> {
  AddNewQuestionCubit() : super(AddNewQuestionInitial()) {
    emit(AddNewQuestionCubitLoaded([createQuestionWidget(0)]));
  }

  CustomQuestionWidget createQuestionWidget(int index) {
    final questionController = TextEditingController();
    final answerControllers = List.generate(4, (_) => TextEditingController());
    return CustomQuestionWidget(
      index: index,
      questionController: questionController,
      answerControllers: answerControllers,
      selectedAnswerIndex: -1,
      onAnswerSelected: (selectIndex) =>
          selectCorrectAnswer(answerIndex: selectIndex, questionIndex: index),
    );
  }

  void addNewQuestion() {
    if (state is AddNewQuestionCubitLoaded) {
      final currentState = state as AddNewQuestionCubitLoaded;
      final newQuestions =
          List<CustomQuestionWidget>.from(currentState.questions);
      newQuestions.add(createQuestionWidget(newQuestions.length));
      emit(AddNewQuestionCubitLoaded(newQuestions));
    }
  }

  void removeQuestion(int index) {
    if (state is AddNewQuestionCubitLoaded) {
      final currentState = state as AddNewQuestionCubitLoaded;
      final newQuestions =
          List<CustomQuestionWidget>.from(currentState.questions);
      newQuestions.removeAt(index);
      // Update indices
      for (int i = 0; i < newQuestions.length; i++) {
        newQuestions[i] = newQuestions[i].copyWith(index: i);
      }
      emit(AddNewQuestionCubitLoaded(newQuestions));
    }
  }

  Future<void> collectAndUploadData(BuildContext context) async {
    if (state is AddNewQuestionCubitLoaded) {
      final currentState = state as AddNewQuestionCubitLoaded;
      final questionData =
          List<CustomQuestionWidget>.from(currentState.questions)
              .map((widget) {
                final questionText = widget.questionController.text;
                final answers = widget.answerControllers
                    .map((controller) => controller.text)
                    .toList();
                final nonEmptyAnswers =
                    answers.where((answer) => answer.isNotEmpty).toList();
                if (nonEmptyAnswers.length < 2) {
                  customErrorCreateAnswerShowDialog(context);
                  return null;
                }
                return {
                  'question': questionText,
                  'answers': answers,
                  'correct_answer': widget.selectedAnswerIndex,
                };
              })
              .where((element) => element != null)
              .toList();
      if (questionData.isNotEmpty) {
        try {
          DocumentReference docRef = await FirebaseFirestore.instance
              .collection('questions')
              .add({'questions': questionData});
          String quizID = docRef.id;
          await copyQuizIdShowDialog(context, quizID);
        } catch (e) {
          errorScaffoldMessenger(context, e);
        }
      }
    }
  }

  void errorScaffoldMessenger(BuildContext context, Object e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      e.toString(),
    )));
  }

  void selectCorrectAnswer(
      {required int questionIndex, required int answerIndex}) {
    if (state is AddNewQuestionCubitLoaded) {
      final currentState = state as AddNewQuestionCubitLoaded;
      final updatedQuestions =
          List<CustomQuestionWidget>.from(currentState.questions);
      final updatedQuestion = updatedQuestions[questionIndex]
          .copyWith(selectedAnswerIndex: answerIndex);
      updatedQuestions[questionIndex] = updatedQuestion;
      emit(AddNewQuestionCubitLoaded(updatedQuestions));
    }
  }
}
