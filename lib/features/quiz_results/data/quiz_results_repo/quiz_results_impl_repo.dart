import 'package:cloud_firestore/cloud_firestore.dart';

import 'quiz_results_repo.dart';

class QuizResultsImplRepo implements QuizResultsRepo {
  @override
  Future<QuerySnapshot<Object?>> fetchStudentDocuments(
      {required String quizCode}) async {
    CollectionReference studentsRef = FirebaseFirestore.instance
        .collection('StudentAnswers')
        .doc(quizCode)
        .collection('students');
    QuerySnapshot studentDocs = await studentsRef.get();
    return studentDocs;
  }

  @override
  Future<QuerySnapshot<Object?>> fetchStudentsResponsesDoc(
      {required String quizCode, required String studentName}) async {
    CollectionReference studentCollection = FirebaseFirestore.instance
        .collection('StudentAnswers')
        .doc(quizCode)
        .collection('students');
    QuerySnapshot studentsResponsesDoc = await studentCollection.get();
    return studentsResponsesDoc;
  }
}
