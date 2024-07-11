import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/features/quiz_results/data/quiz_results_repo/quiz_results_repo.dart';
import 'package:quiz_app/features/student/data/model/student_response_model.dart';

part 'students_results_state.dart';

class StudentsResultsCubit extends Cubit<StudentsResultsState> {
  StudentsResultsCubit(this.quizResultsRepo) : super(StudentsResultsInitial());
  final QuizResultsRepo quizResultsRepo;
  int numberOfStudents = 0;
  Future<void> fetchStudentResponsesFirebase({
    required String quizCode,
  }) async {
    emit(StudentsResultsLoading());
    try {
      QuerySnapshot studentSnapshots =
          await quizResultsRepo.fetchStudentsData(quizCode: quizCode);

      List<StudentResponseModel> studentResponses = studentSnapshots.docs
          .map((doc) =>
              StudentResponseModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
      numberOfStudents = studentResponses.length;
      emit(StudentsResultsSuccess(studentResponses: studentResponses));
    } catch (e) {
      // Handle errors, e.g., show a message to the user
      emit(StudentsResultsError(errorMessage: e.toString()));
    }
  }
}
