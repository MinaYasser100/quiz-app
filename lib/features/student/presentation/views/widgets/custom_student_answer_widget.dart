import 'package:flutter/material.dart';
import 'package:quiz_app/core/constant/app_color.dart';

class CustomStudentAnswerWidget extends StatelessWidget {
  const CustomStudentAnswerWidget({
    super.key,
    required this.isLast,
    required this.answerText,
    this.isSelect = false,
  });
  final bool isLast;
  final String answerText;
  final bool isSelect;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              icon: Icon(
                isSelect
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
                color: AppColor.primaryColor,
              ),
              onPressed: () {},
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                answerText,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        if (!isLast)
          Divider(
            color: Colors.grey[300],
          )
      ],
    );
  }
}
