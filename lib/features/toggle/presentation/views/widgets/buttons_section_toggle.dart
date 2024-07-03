import 'package:flutter/material.dart';
import 'package:quiz_app/core/widgets/custom_button_widget.dart';
import 'package:quiz_app/features/student/presentation/views/student_view.dart';

import '../../../../teacher/presentation/view/teacher_view.dart';

class ButtonsSectionToggle extends StatelessWidget {
  const ButtonsSectionToggle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButtonWidget(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TeacherView(),
              ),
            );
          },
          text: 'Teacher',
        ),
        const SizedBox(
          height: 20,
        ),
        CustomButtonWidget(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StudentView(),
                ));
          },
          text: 'Student',
        ),
        const SizedBox(
          height: 100,
        ),
      ],
    );
  }
}
