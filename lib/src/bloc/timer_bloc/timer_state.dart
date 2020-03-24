import 'package:equatable/equatable.dart';

abstract class TimerState extends Equatable {
  final int duration;

  const TimerState(this.duration);

  @override
  List<Object> get props => [duration];
}

class Ready extends TimerState {
  const Ready(int duration) : super(duration);
}

class Paused extends TimerState {
  const Paused(int duration) : super(duration);
}

class Running extends TimerState {
  const Running(int duration) : super(duration);
}

class Finished extends TimerState {
  const Finished() : super(0);
}
