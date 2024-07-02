import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/constant/app_color.dart';
import 'package:quiz_app/features/teacher/presentation/manager/add_new_question_cubit.dart';

import 'custom_answer_position.dart';
import 'custom_remove_question_button.dart';
import 'custom_text_from_field.dart';

class CustomQuestionWidget extends StatelessWidget {
  const CustomQuestionWidget({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, // Allow overflow to show the CircleAvatar
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[100],
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
        ),
        if (index != 0)
          CustomRemoveQuestionButton(
            index: index,
            onTap: () {
              context.read<AddNewQuestionCubit>().removeQuestion(index);
            },
          ),
      ],
    );
  }
}
