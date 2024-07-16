import 'package:quiz_app/features/toggle/data/model/question_model.dart';

class QuizModel {
  final String title;
  final List<QuestionModel> questions;

  QuizModel({
    required this.title,
    required this.questions,
  });

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'] as String,
      questions: (map['questions'] as List)
          .map(
            (questionData) =>
                QuestionModel.fromMap(questionData as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((question) => question.toMap()).toList(),
    };
  }
}
