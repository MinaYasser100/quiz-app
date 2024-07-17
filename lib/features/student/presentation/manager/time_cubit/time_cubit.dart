import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'time_states.dart';

class TimeCubit extends Cubit<TimeStates> {
  TimeCubit(int initialTime) : super(TimeCubitInitial(initialTime));

  Timer? _timer;

  void startTimer() {
    if (state is TimeCubitInitial) {
      emit(
        TimeCubitRunning(
            initialTime: state.initialTime, remainingTime: state.initialTime),
      );
      _stateTime();
    } else if (state is TimeCubitRunning) {
      _stateTime();
    }
  }

  void _stateTime() {
    _timer = Timer.periodic(const Duration(seconds: 1), (time) {
      if (state is TimeCubitRunning) {
        final runningState = state as TimeCubitRunning;
        if (runningState.remainingTime > 0) {
          emit(
            TimeCubitRunning(
              initialTime: runningState.initialTime,
              remainingTime: runningState.remainingTime - 1,
            ),
          );
        } else {
          _timer?.cancel();
          emit(TimeCubitFinish(initialTime: runningState.initialTime));
        }
      }
    });
  }

  void pauseTimer() {
    _timer?.cancel();
  }

  void finishQuiz() {
    _timer?.cancel();
    if (state is TimeCubitRunning) {
      emit(TimeCubitFinish(initialTime: state.initialTime));
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
