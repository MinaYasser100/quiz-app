import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());
}
