import 'package:flutter/material.dart';
import 'package:quiz_app/features/teacher/presentation/view/func/custom_show_dialog.dart';

Future<dynamic> customNoInternetShowDialog(BuildContext context) {
  return customShowDialog(
    context: context,
    title: 'The internet Connection',
    contentText: 'There is no internet to view the data',
  );
}
