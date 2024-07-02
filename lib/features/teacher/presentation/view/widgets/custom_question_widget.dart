import 'package:flutter/material.dart';
import 'package:quiz_app/core/constant/app_color.dart';

import 'custom_answer_position.dart';
import 'custom_text_from_field.dart';

class CustomQuestionWidget extends StatelessWidget {
  const CustomQuestionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColor.secondColor, // Border color
          width: 1.0, // Border width
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Question'),
            CustomTextFromField(),
            SizedBox(
              height: 20,
            ),
            Text('Answer'),
            CustomAnswerPosition(),
            CustomAnswerPosition(),
            CustomAnswerPosition(),
            CustomAnswerPosition(
              isLast: true,
            ),
          ],
        ),
      ),
    );
  }
}
