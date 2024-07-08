import 'package:quiz_app/features/toggle/data/model/question_model.dart';

class StudentResponseModel {
  final String name;
  final String section;
  final Map<int, int> selectedAnswers;
  final List<QuestionModel> questions;
  final int result;

  StudentResponseModel({
    required this.name,
    required this.section,
    required this.selectedAnswers,
    required this.questions,
    required this.result,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'section': section,
      'selected_answers':
          selectedAnswers.map((key, value) => MapEntry(key.toString(), value)),
      'questions': questions.map((question) => question.toMap()).toList(),
      'result': result,
    };
  }
}
