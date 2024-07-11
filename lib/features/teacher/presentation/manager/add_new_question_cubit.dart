import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/features/teacher/presentation/view/func/copy_quiz_id_show_dialog.dart';
import 'package:quiz_app/features/teacher/presentation/view/func/store_quiz_ids_in_hive.dart';
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
      final List<Map<String, dynamic>> questionData = [];

      for (var widget in currentState.questions) {
        final questionWidget =
            widget as CustomQuestionWidget; // Cast to CustomQuestionWidget
        final questionText = questionWidget.questionController.text;

        if (questionText.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Question text cannot be empty.')),
          );
          return;
        }

        final answers = questionWidget.answerControllers
            .map((controller) => controller.text)
            .toList();
        final nonEmptyAnswers =
            answers.where((answer) => answer.isNotEmpty).toList();

        if (nonEmptyAnswers.length < 2) {
          customErrorCreateAnswerShowDialog(context);
          return;
        }

        questionData.add({
          'question': questionText,
          'answers': answers,
          'correct_answer': questionWidget.selectedAnswerIndex,
        });
      }

      if (questionData.isNotEmpty) {
        try {
          DocumentReference docRef = await FirebaseFirestore.instance
              .collection('questions')
              .add({'questions': questionData});
          String quizID = docRef.id;
          await storeQuizIdsInHive(quizID);
          await copyQuizIdShowDialog(context, quizID);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Data uploaded successfully')),
          );
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
