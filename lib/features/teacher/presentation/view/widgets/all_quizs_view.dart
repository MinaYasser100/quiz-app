import 'package:flutter/material.dart';
import 'package:quiz_app/core/constant/app_color.dart';

import 'all_quizs_body_view.dart';

class AllQuizsView extends StatelessWidget {
  const AllQuizsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColor.secondColor,
        title: const Text(
          'All Your Quizs',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 0.7,
      ),
      body: const AllQuizsBodyView(),
    );
  }
}
