import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/src/resources/app_colors.dart';

class AppTheme {
  static ThemeData appTheme() {
    return ThemeData(
        primaryColor: Colors.red,
        backgroundColor: Colors.red,
        textTheme: TextTheme(
            title: TextStyle(color: AppColors.black),
            caption: TextStyle(color: AppColors.white)),
        brightness: Brightness.light,
       );
  }
}
