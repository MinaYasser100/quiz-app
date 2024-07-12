import 'package:flutter/material.dart';
import 'package:quiz_app/core/styles/styles.dart';

class ErrorDownloadData extends StatelessWidget {
  const ErrorDownloadData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'An Error ocurred while downloading',
        style: Styles.textStyle20Red,
        textAlign: TextAlign.center,
      ),
    );
  }
}
