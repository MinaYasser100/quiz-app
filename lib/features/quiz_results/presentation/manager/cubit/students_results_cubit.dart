import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'students_results_state.dart';

class StudentsResultsCubit extends Cubit<StudentsResultsState> {
  StudentsResultsCubit() : super(StudentsResultsInitial());
}
