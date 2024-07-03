import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/features/teacher/presentation/manager/add_new_question_cubit.dart';

import 'teahcer_button_section_body.dart';

class TeacherBodyView extends StatelessWidget {
  const TeacherBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNewQuestionCubit(),
      child: BlocBuilder<AddNewQuestionCubit, AddNewQuestionStates>(
        builder: (context, state) {
          if (state is AddNewQuestionCubitLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(20),
                          child: state.questions[index],
                        );
                      },
                      childCount: state.questions.length,
                    ),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: TeacherButtonSectionBody(
                      onFinish: () async {
                        try {
                          await context
                              .read<AddNewQuestionCubit>()
                              .collectAndUploadData(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Data uploaded successfully')));
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e.toString())));
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
