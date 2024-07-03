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
    required this.questionController,
    required this.answerControllers,
    required this.selectedAnswerIndex,
    required this.onAnswerSelected,
  });
  final int index;
  final TextEditingController questionController;
  final List<TextEditingController> answerControllers;
  final int selectedAnswerIndex;
  final ValueChanged<int> onAnswerSelected;

  CustomQuestionWidget copyWith({int? index, int? selectedAnswerIndex}) {
    return CustomQuestionWidget(
      index: index ?? this.index,
      questionController: questionController,
      answerControllers: answerControllers,
      selectedAnswerIndex: selectedAnswerIndex ?? this.selectedAnswerIndex,
      onAnswerSelected: onAnswerSelected,
    );
  }

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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Question'),
                CustomTextFromField(
                  controller: questionController,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Answer'),
                for (int i = 0; i < answerControllers.length; i++)
                  CustomAnswerPosition(
                    controller: answerControllers[i],
                    isLast: i == answerControllers.length - 1 ? true : false,
                    isSelect: i == selectedAnswerIndex,
                    onSelect: () => onAnswerSelected(i),
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
