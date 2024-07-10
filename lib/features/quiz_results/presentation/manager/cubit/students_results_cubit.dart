import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/features/quiz_results/data/quiz_results_repo/quiz_results_repo.dart';
import 'package:quiz_app/features/student/data/model/student_response_model.dart';

part 'students_results_state.dart';

class StudentsResultsCubit extends Cubit<StudentsResultsState> {
  StudentsResultsCubit(this.quizResultsRepo) : super(StudentsResultsInitial());
  final QuizResultsRepo quizResultsRepo;
  Future<void> getAllStudentResponses({
    required String quizCode,
  }) async {
    try {
      // Reference to the students' collection for the specified quiz
      final studentsCollectionRef = FirebaseFirestore.instance
          .collection('StudentAnswers')
          .doc(quizCode)
          .collection('students');

      // Fetch the student documents from the collection
      final querySnapshot = await studentsCollectionRef.get();

      // The size property gives the number of documents in the collection
      print(querySnapshot.docs);
    } catch (e) {
      print('Error fetching student responses: $e');
      throw Exception('Failed to fetch student responses');
    }
  }
}
