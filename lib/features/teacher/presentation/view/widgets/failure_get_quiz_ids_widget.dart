import 'package:flutter/material.dart';
import 'package:quiz_app/core/styles/styles.dart';

class FailureGetQuizIdsWidget extends StatelessWidget {
  const FailureGetQuizIdsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Text(
        'An error occurred while downloading',
        style: Styles.textStyle20.copyWith(color: Colors.red),
        textAlign: TextAlign.center,
      ),
    );
  }
}
