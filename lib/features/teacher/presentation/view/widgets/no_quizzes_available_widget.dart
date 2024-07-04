import 'package:flutter/material.dart';
import 'package:quiz_app/core/styles/styles.dart';

class NoQuizzesAvailableWidget extends StatelessWidget {
  const NoQuizzesAvailableWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          'No quizzes available !!',
          style: Styles.textStyle24,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
