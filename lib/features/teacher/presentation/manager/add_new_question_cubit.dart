import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/features/teacher/presentation/view/func/copy_quiz_id_show_dialog.dart';
import 'package:quiz_app/features/teacher/presentation/view/func/store_quiz_ids_in_hive.dart';
import '../view/func/custom_show_dialog.dart';
import '../view/func/custom_error_create_answer_show_dialog.dart';
import '../view/widgets/custom_question_widget.dart';

part 'add_new_question_states.dart';

class AddNewQuestionCubit extends Cubit<AddNewQuestionStates> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  AddNewQuestionCubit() : super(AddNewQuestionInitial()) {
    emit(
        AddNewQuestionCubitLoaded([createQuestionWidget(0)], isLoading: false));
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
      emit(AddNewQuestionCubitLoaded(newQuestions,
          isLoading: currentState.isLoading));
    }
  }

  void removeQuestion(int index) {
    if (state is AddNewQuestionCubitLoaded) {
      final currentState = state as AddNewQuestionCubitLoaded;
      final newQuestions =
          List<CustomQuestionWidget>.from(currentState.questions);
      newQuestions.removeAt(index);
      for (int i = 0; i < newQuestions.length; i++) {
        newQuestions[i] = newQuestions[i].copyWith(index: i);
      }
      emit(AddNewQuestionCubitLoaded(newQuestions,
          isLoading: currentState.isLoading));
    }
  }

  Future<void> collectAndUploadData(BuildContext context) async {
    if (state is AddNewQuestionCubitLoaded) {
      final currentState = state as AddNewQuestionCubitLoaded;
      emit(AddNewQuestionCubitLoaded(currentState.questions, isLoading: true));
      final title = titleController.text;
      final List<Map<String, dynamic>> questionData = [];
      final timeText = timeController.text;
      final int? time = int.tryParse(timeText);
      if (title.isEmpty || time == null) {
        customShowDialog(
          context: context,
          title: 'Quiz Title and Time',
          contentText:
              'Please enter the quiz title and time to upload the quiz',
        );
        emit(AddNewQuestionCubitLoaded(currentState.questions,
            isLoading: false));
        return;
      }
      for (var widget in currentState.questions) {
        final questionWidget = widget;
        final questionText = questionWidget.questionController.text;

        if (questionText.isEmpty) {
          customShowDialog(
              context: context,
              title: 'Question',
              contentText:
                  'Question text cannot be empty, please write the question');
          emit(AddNewQuestionCubitLoaded(currentState.questions,
              isLoading: false));
          return;
        }

        final answers = questionWidget.answerControllers
            .map((controller) => controller.text)
            .toList();
        final nonEmptyAnswers =
            answers.where((answer) => answer.isNotEmpty).toList();

        if (nonEmptyAnswers.length < 2) {
          customErrorCreateAnswerShowDialog(context);
          emit(AddNewQuestionCubitLoaded(currentState.questions,
              isLoading: false));
          return;
        }
        if (questionWidget.selectedAnswerIndex == -1) {
          customShowDialog(
            context: context,
            title: 'Select Correct Answer',
            contentText: 'Please select the correct answer for each question.',
          );
          emit(AddNewQuestionCubitLoaded(currentState.questions,
              isLoading: false));
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
              .add({
            'title': title,
            'time': time * 60,
            'questions': questionData
          });
          String quizID = docRef.id;
          await storeQuizIdsInHive(quizID);
          await copyQuizIdShowDialog(context, quizID);
          customScaffoldMessenger(context, 'Data uploaded successfully');
        } catch (e) {
          customScaffoldMessenger(context, e.toString());
        }
      }
      emit(AddNewQuestionCubitLoaded(currentState.questions, isLoading: false));
    }
  }

  void customScaffoldMessenger(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      text,
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
      emit(AddNewQuestionCubitLoaded(updatedQuestions,
          isLoading: currentState.isLoading));
    }
  }
}
