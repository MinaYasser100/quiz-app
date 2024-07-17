part of 'time_cubit.dart';

class TimeStates {
  final int initialTime;

  TimeStates({required this.initialTime});
}

final class TimeCubitInitial extends TimeStates {
  TimeCubitInitial(int initialTime) : super(initialTime: initialTime);
}

final class TimeCubitRunning extends TimeStates {
  final int remainingTime;

  TimeCubitRunning({required super.initialTime, required this.remainingTime});
}

final class TimeCubitFinish extends TimeStates {
  TimeCubitFinish({required super.initialTime});
}
