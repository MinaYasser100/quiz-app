import 'package:flutter/material.dart';
import 'package:quiz_app/core/constant/app_color.dart';
import 'package:quiz_app/core/widgets/custom_button_widget.dart';

import 'custom_question_widget.dart';

class TeacherBodyView extends StatelessWidget {
  const TeacherBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          const CustomQuestionWidget(),
          const SizedBox(
            height: 20,
          ),
          CustomButtonWidget(
            text: 'Next',
            buttonColor: AppColor.secondColor,
            onPressed: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButtonWidget(
            text: 'Finish',
            buttonColor: AppColor.secondColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
