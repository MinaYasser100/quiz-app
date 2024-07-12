import 'package:flutter/material.dart';
import 'package:quiz_app/core/styles/styles.dart';

class NoStudentWidget extends StatelessWidget {
  const NoStudentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No student has taken the exam yet !!',
        style: Styles.textStyle20,
        textAlign: TextAlign.center,
      ),
    );
  }
}
