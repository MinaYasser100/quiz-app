import 'package:flutter/material.dart';
import 'package:quiz_app/core/constant/app_color.dart';

class CustomReviewQuestionSectionWidget extends StatelessWidget {
  const CustomReviewQuestionSectionWidget({
    super.key,
    required this.question,
  });

  final String question;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Question'),
        const SizedBox(
          height: 4,
        ),
        Text(
          question,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Divider(
          color: AppColor.primaryColor,
        ),
      ],
    );
  }
}
