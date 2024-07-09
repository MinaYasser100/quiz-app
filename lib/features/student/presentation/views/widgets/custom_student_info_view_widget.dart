import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/constant/app_color.dart';
import 'package:quiz_app/features/student/presentation/manager/quiz_cubit/quiz_cubit.dart';
import 'package:quiz_app/features/student/presentation/views/func/name_validator.dart';
import 'package:quiz_app/features/teacher/presentation/view/widgets/custom_text_from_field.dart';

class CustomStudentInfoViewWidget extends StatelessWidget {
  const CustomStudentInfoViewWidget({
    super.key,
    required this.infoKey,
    required this.nameController,
    required this.sectionController,
  });

  final GlobalKey<FormState> infoKey;
  final TextEditingController nameController;
  final TextEditingController sectionController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: infoKey,
      autovalidateMode: context.read<QuizCubit>().autovalidateMode,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextFromField(
            labelText: 'Your Name',
            controller: nameController,
            color: AppColor.primaryColor,
            validator: nameValidator,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFromField(
            labelText: 'Your Section',
            controller: sectionController,
            color: AppColor.primaryColor,
            validator: (p0) {
              if (p0!.isEmpty) {
                return 'Please enter your section';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
