import 'package:flutter/material.dart';
import 'package:quiz_app/core/widgets/custom_button_widget.dart';
import 'package:quiz_app/features/student/presentation/views/student_view.dart';
import 'package:quiz_app/features/teacher/presentation/view/widgets/custom_text_from_field.dart';

import '../../../../teacher/presentation/view/teacher_view.dart';

class ButtonsSectionToggle extends StatefulWidget {
  const ButtonsSectionToggle({
    super.key,
  });

  @override
  State<ButtonsSectionToggle> createState() => _ButtonsSectionToggleState();
}

class _ButtonsSectionToggleState extends State<ButtonsSectionToggle> {
  TextEditingController quizCodeController = TextEditingController();
  GlobalKey<FormState> toggleKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.always;
  @override
  void dispose() {
    quizCodeController.dispose();
    super.dispose();
  }

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
            quizCodeShowDialog(context);
          },
          text: 'Student',
        ),
        const SizedBox(
          height: 100,
        ),
      ],
    );
  }

  Future<dynamic> quizCodeShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Quiz Code',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        content: Form(
          key: toggleKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextFromField(
                controller: quizCodeController,
                color: Colors.black,
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return 'Please enter quiz code';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              navigationToQuiz(context);
            },
            child: const Text(
              'OK',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  void navigationToQuiz(BuildContext context) {
    if (toggleKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StudentView(
            quizCode: quizCodeController.text,
          ),
        ),
      );
    } else {
      autovalidateMode = AutovalidateMode.disabled;
      setState(() {});
    }
  }
}
