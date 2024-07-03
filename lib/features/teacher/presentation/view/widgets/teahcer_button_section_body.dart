import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/constant/app_color.dart';
import 'package:quiz_app/core/widgets/custom_button_widget.dart';
import 'package:quiz_app/features/teacher/presentation/manager/add_new_question_cubit.dart';

class TeacherButtonSectionBody extends StatelessWidget {
  const TeacherButtonSectionBody({
    super.key,
    required this.onFinish,
  });
  final void Function() onFinish;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButtonWidget(
          text: 'Next',
          buttonColor: AppColor.secondColor,
          onPressed: () => context.read<AddNewQuestionCubit>().addNewQuestion(),
        ),
        const SizedBox(
          height: 20,
        ),
        CustomButtonWidget(
          text: 'Finish',
          buttonColor: AppColor.secondColor,
          onPressed: onFinish,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
