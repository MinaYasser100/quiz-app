import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/constant/app_color.dart';
import 'package:quiz_app/features/teacher/presentation/manager/all_quizs_cubit/all_quizs_cubit.dart';

import 'all_quizs_body_view.dart';

class AllQuizsView extends StatelessWidget {
  const AllQuizsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllQuizsCubit()..getQuizIdsHive(),
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: AppColor.secondColor,
          title: const Text(
            'All Your Quizzes',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          elevation: 0.7,
        ),
        body: const AllQuizsBodyView(),
      ),
    );
  }
}
