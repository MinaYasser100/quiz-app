import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/features/toggle/data/model/question_model.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit(List<QuestionModel> questions) : super(QuizInitial()) {
    emit(QuizLoaded(questions: questions, selectedAnswers: {}));
  }

  void onSelect({required int questionIndex, required int answerIndex}) {
    final currentSelect = state as QuizLoaded;
    final updateSelectedAnswer =
        Map<int, int>.from(currentSelect.selectedAnswers);
    updateSelectedAnswer[questionIndex] = answerIndex;
    emit(currentSelect.copyWith(selectedAnswers: updateSelectedAnswer));
  }
}
