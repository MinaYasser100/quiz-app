import 'package:flutter/material.dart';

import 'custom_question_widget.dart';

class TeacherBodyView extends StatelessWidget {
  const TeacherBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          CustomQuestionWidget(),
        ],
      ),
    );
  }
}
