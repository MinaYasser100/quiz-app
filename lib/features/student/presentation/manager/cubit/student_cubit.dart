import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(StudentInitial());
  List<Map<String, dynamic>>? questions;
  Future<void> getQuizQuestions({required String quizCode}) async {
    emit(StudentCubitGetQuizQuestionsLoading());
    try {
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await FirebaseFirestore.instance
              .collection('questions')
              .doc(quizCode)
              .get();
      if (documentSnapshot.exists) {
        Map<String, dynamic>? data = documentSnapshot.data();
        if (data != null) {
          questions = List<Map<String, dynamic>>.from(data['questions']);
          print(questions);
          emit(StudentCubitGetQuizQuestionsSuccess());
        } else {
          emit(StudentCubitGetQuizQuestionsFailure(
              error: 'No data found for the provided quiz code.'));
        }
      } else {
        emit(StudentCubitGetQuizQuestionsFailure(
            error: 'Quiz not found for the provided quiz code.'));
      }
    } catch (e) {
      emit(StudentCubitGetQuizQuestionsFailure(error: e.toString()));
    }
  }
}
