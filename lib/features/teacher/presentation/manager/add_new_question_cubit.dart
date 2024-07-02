import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view/widgets/custom_question_widget.dart';

part 'add_new_question_states.dart';

class AddNewQuestionCubit extends Cubit<AddNewQuestionStates> {
  AddNewQuestionCubit() : super(AddNewQuestionInitial()) {
    emit(AddNewQuestionCubitLoaded([
      const CustomQuestionWidget(
        index: 0,
      )
    ]));
  }

  void addNewQuestion() {
    if (state is AddNewQuestionCubitLoaded) {
      final currentState = state as AddNewQuestionCubitLoaded;
      final newQuestions = List<Widget>.from(currentState.questions);
      newQuestions.add(CustomQuestionWidget(index: newQuestions.length));
      emit(AddNewQuestionCubitLoaded(newQuestions));
    }
  }

  void removeQuestion(int index) {
    if (state is AddNewQuestionCubitLoaded) {
      final currentState = state as AddNewQuestionCubitLoaded;
      final newQuestions = List<Widget>.from(currentState.questions);
      newQuestions.removeAt(index);
      // Update indices
      for (int i = 0; i < newQuestions.length; i++) {
        newQuestions[i] = CustomQuestionWidget(index: i);
      }
      emit(AddNewQuestionCubitLoaded(newQuestions));
    }
  }
}
