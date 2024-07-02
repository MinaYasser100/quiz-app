import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view/widgets/custom_question_widget.dart';

part 'teacher_states.dart';

class AddNewQuestionCubit extends Cubit<AddNewQuestionStates> {
  AddNewQuestionCubit() : super(AddNewQuestionInitial()) {
    emit(AddNewQuestionCubitLoaded([const CustomQuestionWidget()]));
  }

  void addNewQuestion() {
    if (state is AddNewQuestionCubitLoaded) {
      final currentState = state as AddNewQuestionCubitLoaded;
      final newQuestions = List<Widget>.from(currentState.questions);
      newQuestions.add(const CustomQuestionWidget());
      emit(AddNewQuestionCubitLoaded(newQuestions));
    }
  }
}
