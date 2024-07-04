import 'package:flutter/material.dart';
import 'package:quiz_app/core/constant/app_color.dart';
import 'package:quiz_app/features/teacher/presentation/view/widgets/all_quizs_view.dart';

AppBar teacherAppBar(BuildContext context) {
  return AppBar(
    foregroundColor: AppColor.secondColor,
    title: const Text(
      'Create Quiz',
      style: TextStyle(
        fontWeight: FontWeight.w600,
      ),
    ),
    centerTitle: true,
    shadowColor: AppColor.secondColor,
    elevation: 0.7,
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AllQuizsView(),
              ),
            );
          },
          icon: const Icon(Icons.quiz_outlined),
        ),
      ),
    ],
  );
}
