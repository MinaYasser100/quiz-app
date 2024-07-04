import 'package:flutter/material.dart';

import 'func/teacher_app_bar.dart';
import 'widgets/teacher_body_view.dart';

class TeacherView extends StatelessWidget {
  const TeacherView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: teacherAppBar(context),
      body: const TeacherBodyView(),
    );
  }
}
