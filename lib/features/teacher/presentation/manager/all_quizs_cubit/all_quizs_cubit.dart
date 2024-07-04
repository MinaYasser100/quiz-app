import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:quiz_app/core/constant/constant.dart';

part 'all_quizs_state.dart';

class AllQuizsCubit extends Cubit<AllQuizsState> {
  AllQuizsCubit() : super(AllQuizsInitial());

  Future<void> getQuizIdsHive() async {
    emit(AllQuizsGetQuizIdsHiveLoading());
    try {
      var box = Hive.box<List<String>>(hiveQuizID);
      List<String>? quizIds = box.get('ids', defaultValue: []);
      emit(AllQuizsGetQuizIdsHiveSuccess(quizIds: quizIds!));
    } catch (e) {
      emit(AllQuizsGetQuizIdsHiveFailure(error: e.toString()));
    }
  }
}
