import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/src/resources/app_colors.dart';

class AppTheme {
  static ThemeData appTheme() {
    return ThemeData(
        primaryColor: AppColors.primaryColor,
        backgroundColor: AppColors.white,
        cardColor: AppColors.cardWhite,
        accentColor: AppColors.primaryColor,
        dividerColor: AppColors.dividerColor,
        textTheme: TextTheme(
            title: TextStyle(color: AppColors.black),
            caption: TextStyle(color: AppColors.white)),
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
            color: AppColors.white,
            brightness: Brightness.light,
            iconTheme: IconThemeData(color: AppColors.black)),
        snackBarTheme:
            SnackBarThemeData(backgroundColor: AppColors.primaryColor));
  }
}
