import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/func/check_internet_connection.dart';
import 'package:quiz_app/core/func/custom_no_internet_show_dialog.dart';
import 'package:quiz_app/core/widgets/custom_button_widget.dart';
import 'package:quiz_app/features/student/data/model/student_response_model.dart';
import 'package:quiz_app/features/student/presentation/manager/quiz_cubit/quiz_cubit.dart';
import 'package:quiz_app/features/student/presentation/views/func/reslut_show_dialog.dart';

import 'student_body_view.dart';

class CustomStudentSubmitWidget extends StatelessWidget {
  const CustomStudentSubmitWidget({
    super.key,
    required this.infoKey,
    required this.widget,
    required this.nameController,
    required this.sectionController,
  });

  final GlobalKey<FormState> infoKey;
  final StudentBodyView widget;
  final TextEditingController nameController;
  final TextEditingController sectionController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<QuizCubit, QuizState>(builder: (context, state) {
          if (state is QuizLoaded) {
            return CustomButtonWidget(
              text: 'Submit',
              onPressed: () async {
                bool internet = await checkInternetConnection();
                if (infoKey.currentState!.validate()) {
                  if (internet) {
                    final int result =
                        context.read<QuizCubit>().calculateStudentResult();
                    await context.read<QuizCubit>().saveStudentResponseFirebase(
                          context: context,
                          quizCode: widget.quizCode,
                          studentResponseModel: StudentResponseModel(
                              name: nameController.text,
                              section: sectionController.text,
                              selectedAnswers: state.selectedAnswers,
                              questions: state.questions,
                              result: result),
                        );
                    await resultShowDialog(
                      context: context,
                      questionsLength: state.questions.length,
                      result: result,
                      studentResponseModel: StudentResponseModel(
                          name: nameController.text,
                          section: sectionController.text,
                          selectedAnswers: state.selectedAnswers,
                          questions: state.questions,
                          result: result),
                    );
                  } else {
                    customNoInternetShowDialog(context);
                  }
                } else {
                  context.read<QuizCubit>().changeAutovalidateMode();
                }
              },
            );
          } else {
            return CustomButtonWidget(
              text: 'Submit',
              onPressed: () {
                if (infoKey.currentState!.validate()) {
                } else {
                  context.read<QuizCubit>().changeAutovalidateMode();
                }
              },
            );
          }
        }),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
