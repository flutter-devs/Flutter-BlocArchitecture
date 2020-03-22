import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter_bloc_architecture/src/ui/screens/timer_screen.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  TimerScreen timerScreen;
}
