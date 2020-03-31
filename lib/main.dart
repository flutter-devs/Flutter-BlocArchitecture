import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/src/bloc_delegate/simple_bloc_delegate.dart';
import 'package:flutter_bloc_architecture/src/di/app_config.dart';
import 'package:flutter_bloc_architecture/src/my_app.dart';

void main() {

  /*Called whenever an [event] is `added` to any [bloc] with the given [bloc] and [event].
 A great spot to add universal logging/analytics.*/
  BlocSupervisor.delegate = SimpleBlocDelegate();
  setupAppConfig();
  runApp(MyApp());
}
