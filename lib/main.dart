import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/src/bloc_delegate/simple_bloc_delegate.dart';
import 'package:flutter_bloc_architecture/src/di/app_config.dart';
import 'package:flutter_bloc_architecture/src/my_app.dart';

void main() {
  Bloc.observer = SimpleBlocDelegate();
  setupAppConfig();
  runApp(MyApp());
}
