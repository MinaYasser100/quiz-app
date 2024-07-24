import 'package:flutter/material.dart';
import 'package:quiz_app/core/constant/app_color.dart';

class CustomQuizIdItemWidget extends StatelessWidget {
  const CustomQuizIdItemWidget({
    super.key,
    required this.index,
    required this.quizIdText,
    required this.titleText,
  });
  final int index;
  final String quizIdText;
  final String titleText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.secondColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 24,
            child: Text(
              (index + 1).toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          title: Text(
            titleText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            quizIdText,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
