import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/features/student/data/model/quiz_model.dart';
import 'package:quiz_app/features/student/presentation/manager/time_cubit/time_cubit.dart';
import 'package:quiz_app/features/student/presentation/views/func/format_time.dart';
import 'package:quiz_app/features/student/presentation/views/widgets/student_body_view.dart';
import 'package:quiz_app/features/toggle/presentation/views/toggle_view.dart';

import 'func/student_app_bar.dart';

class StudentView extends StatelessWidget {
  const StudentView(
      {super.key, required this.quizCode, required this.quizModel});
  final String quizCode;
  final QuizModel quizModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimeCubit(quizModel.time)..startTimer(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: BlocBuilder<TimeCubit, TimeStates>(builder: (context, state) {
            String formattedTime;
            if (state is TimeCubitInitial) {
              formattedTime = formatTime(state.initialTime);
            } else if (state is TimeCubitRunning) {
              formattedTime = formatTime(state.remainingTime);
            } else {
              formattedTime = '00:00';
            }
            return studentAppBar(
              title: quizModel.title,
              time: formattedTime,
            );
          }),
        ),
        body: BlocListener<TimeCubit, TimeStates>(
          listener: (context, state) {
            if (state is TimeCubitFinish) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const ToggleView(),
                ),
                (route) => false,
              );
            }
          },
          child: StudentBodyView(
            quizCode: quizCode,
            questions: quizModel.questions,
          ),
        ),
      ),
    );
  }
}
