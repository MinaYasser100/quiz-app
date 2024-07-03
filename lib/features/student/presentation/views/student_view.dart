import 'package:flutter/material.dart';
import 'package:quiz_app/features/student/presentation/views/widgets/student_body_view.dart';

import 'func/student_app_bar.dart';

class StudentView extends StatelessWidget {
  const StudentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: studentAppBar(),
      body: const StudentBodyView(),
    );
  }
}
