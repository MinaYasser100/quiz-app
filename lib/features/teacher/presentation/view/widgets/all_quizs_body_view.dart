import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/constant/app_color.dart';
import 'package:quiz_app/features/teacher/presentation/manager/all_quizs_cubit/all_quizs_cubit.dart';

import 'all_quiz_ids_list_view_widget.dart';
import 'failure_get_quiz_ids_widget.dart';
import 'no_quizzes_available_widget.dart';

class AllQuizsBodyView extends StatelessWidget {
  const AllQuizsBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllQuizsCubit, AllQuizsState>(
      builder: (context, state) {
        if (state is AllQuizsGetQuizIdsHiveLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColor.secondColor,
            ),
          );
        } else if (state is AllQuizsGetQuizIdsHiveSuccess) {
          return AllQuizIdsListViewWidget(
            itemCount: state.quizIds.length,
            quizzesId: state.quizIds,
          );
        } else if (state is AllQuizsGetQuizIdsHiveFailure) {
          return const FailureGetQuizIdsWidget();
        } else {
          return const NoQuizzesAvailableWidget();
        }
      },
    );
  }
}
