import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/features/quiz_results/presentation/manager/cubit/students_results_cubit.dart';

class NumberOfStudentsResults extends StatelessWidget {
  const NumberOfStudentsResults({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsResultsCubit, StudentsResultsState>(
        builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Text(
          context.read<StudentsResultsCubit>().numberOfStudents.toString(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    });
  }
}
