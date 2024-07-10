import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/features/student/data/model/student_response_model.dart';
import 'package:quiz_app/features/toggle/data/model/question_model.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit(List<QuestionModel> questions) : super(QuizInitial()) {
    emit(QuizLoaded(questions: questions, selectedAnswers: {}));
  }

  void onSelect({required int questionIndex, required int answerIndex}) {
    if (state is QuizLoaded) {
      final currentSelect = state as QuizLoaded;
      final updateSelectedAnswer =
          Map<int, int>.from(currentSelect.selectedAnswers);
      updateSelectedAnswer[questionIndex] = answerIndex;
      emit(currentSelect.copyWith(selectedAnswers: updateSelectedAnswer));
    }
  }

  int calculateStudentResult() {
    if (state is QuizLoaded) {
      final currentState = state as QuizLoaded;
      int correct = 0;
      currentState.selectedAnswers.forEach((questionIndex, answerIndex) {
        if (currentState.questions[questionIndex].correctAnswer ==
            answerIndex) {
          correct++;
        }
      });
      return correct;
    }
    return 0;
  }

  AutovalidateMode autovalidateMode = AutovalidateMode.always;

  void changeAutovalidateMode() {
    if (state is QuizLoaded) {
      final currentState = state as QuizLoaded;
      autovalidateMode = AutovalidateMode.disabled;
      emit(currentState);
    }
  }

  Future<void> saveStudentResponseFirebase({
    required String quizCode,
    required StudentResponseModel studentResponseModel,
    required BuildContext context,
  }) async {
    if (state is QuizLoaded) {
      final currentState = state as QuizLoaded;
      try {
        FirebaseFirestore.instance
            .collection('StudentAnswers')
            .doc(quizCode)
            .collection('students')
            .doc(studentResponseModel.name)
            .collection(studentResponseModel.name)
            .add(studentResponseModel.toMap());
        emit(currentState);
      } catch (e) {
        errorScaffoldMessenger(context, e);
        print(e.toString());
      }
    }
  }

  void errorScaffoldMessenger(BuildContext context, Object e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          e.toString(),
        ),
      ),
    );
  }
}
