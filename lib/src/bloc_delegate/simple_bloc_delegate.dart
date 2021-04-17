import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SimpleBlocDelegate extends BlocObserver {
  final bool verbose = false;

  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
   print(event.toString());
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('''
${bloc.runtimeType} - Transition { 
  event: ${transition.event.runtimeType} 
  currentState: ${transition.currentState.runtimeType} 
  nextState: ${transition.nextState.runtimeType}
}
''');
  }
}
