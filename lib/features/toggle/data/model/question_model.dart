class QuestionModel {
  final String question;
  final List<String> answers;
  final int correctAnswer;

  QuestionModel({
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });

  factory QuestionModel.fromMap(Map<String, dynamic> data) {
    return QuestionModel(
      question: data['question'] as String,
      answers: List<String>.from(data['answers']),
      correctAnswer: data['correct_answer'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'answers': answers,
      'correct_answer': correctAnswer,
    };
  }
}
