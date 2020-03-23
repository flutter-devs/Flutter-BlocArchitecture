import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/app_config.dart';
import 'package:flutter_bloc_architecture/src/my_app.dart';
import 'package:flutter_bloc_architecture/src/simple_bloc_delegate.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  setupAppConfig();
  runApp(MyApp());
}
