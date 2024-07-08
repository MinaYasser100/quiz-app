import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/constant/app_color.dart';
import 'package:quiz_app/core/widgets/custom_button_widget.dart';
import 'package:quiz_app/features/student/data/model/student_response_model.dart';
import 'package:quiz_app/features/student/presentation/manager/quiz_cubit/quiz_cubit.dart';
import 'package:quiz_app/features/student/presentation/views/func/name_validator.dart';
import 'package:quiz_app/features/teacher/presentation/view/widgets/custom_text_from_field.dart';
import 'package:quiz_app/features/toggle/data/model/question_model.dart';

import '../func/reslut_show_dialog.dart';
import 'custom_quiz_questions_sliver_list.dart';

class StudentBodyView extends StatefulWidget {
  const StudentBodyView(
      {super.key, required this.questions, required this.quizCode});
  final List<QuestionModel> questions;
  final String quizCode;
  @override
  State<StudentBodyView> createState() => _StudentBodyViewState();
}

class _StudentBodyViewState extends State<StudentBodyView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController sectionController = TextEditingController();
  GlobalKey<FormState> infoKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizCubit(widget.questions),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: BlocBuilder<QuizCubit, QuizState>(
                builder: (context, state) {
                  return Form(
                    key: infoKey,
                    autovalidateMode:
                        context.read<QuizCubit>().autovalidateMode,
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
                },
              ),
            ),
          ),
          CustomQuizQuestionsSliverList(
            questions: widget.questions,
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                BlocBuilder<QuizCubit, QuizState>(builder: (context, state) {
                  if (state is QuizLoaded) {
                    return CustomButtonWidget(
                      text: 'Submit',
                      onPressed: () async {
                        if (infoKey.currentState!.validate()) {
                          final int result = context
                              .read<QuizCubit>()
                              .calculateStudentResult();
                          await context
                              .read<QuizCubit>()
                              .saveStudentResponseFirebase(
                                quizCode: widget.quizCode,
                                studentResponseModel: StudentResponseModel(
                                    name: nameController.text,
                                    section: sectionController.text,
                                    selectedAnswers: state.selectedAnswers,
                                    questions: state.questions,
                                    result: result),
                                context: context,
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
            ),
          )
        ],
      ),
    );
  }
}
