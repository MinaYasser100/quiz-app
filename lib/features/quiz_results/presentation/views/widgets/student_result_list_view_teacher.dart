import 'package:flutter/material.dart';

import 'student_result_for_teacher.dart';

class StudentResultListViewTeacher extends StatelessWidget {
  const StudentResultListViewTeacher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => const StudentResultForTeacher(),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 20,
      ),
    );
  }
}
