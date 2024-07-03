import 'package:flutter/material.dart';
import 'package:quiz_app/core/constant/app_color.dart';
import 'package:quiz_app/core/widgets/custom_button_widget.dart';
import 'package:quiz_app/features/teacher/presentation/view/widgets/custom_question_widget.dart';

class StudentBodyView extends StatelessWidget {
  const StudentBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CustomQuestionWidget(
                      color: AppColor.primaryColor,
                      index: index,
                      questionController: TextEditingController(),
                      answerControllers: [
                        TextEditingController(),
                        TextEditingController(),
                        TextEditingController(),
                        TextEditingController(),
                      ],
                      selectedAnswerIndex: -1,
                      onAnswerSelected: (value) {},
                    ),
                  ),
              childCount: 10),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              CustomButtonWidget(
                text: 'Submit',
                onPressed: () {},
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}
