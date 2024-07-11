import 'package:cloud_firestore/cloud_firestore.dart';

abstract class QuizResultsRepo {
  Future<QuerySnapshot> fetchStudentsData({required String quizCode});
}
