import 'package:cloud_firestore/cloud_firestore.dart';

abstract class QuizResultsRepo {
  Future<QuerySnapshot> fetchStudentDocuments({required String quizCode});

  Future<QuerySnapshot<Object?>> fetchStudentsResponsesDoc(
      {required String quizCode, required String studentName});
}
