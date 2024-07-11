import 'package:cloud_firestore/cloud_firestore.dart';

import 'quiz_results_repo.dart';

class QuizResultsImplRepo implements QuizResultsRepo {
  @override
  Future<QuerySnapshot<Object?>> fetchStudentsData(
      {required String quizCode}) async {
    QuerySnapshot studentSnapshots = await FirebaseFirestore.instance
        .collection('StudentAnswers')
        .doc(quizCode)
        .collection('students')
        .get();
    return studentSnapshots;
  }
}
