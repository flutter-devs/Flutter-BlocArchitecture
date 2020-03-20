import 'package:flutter_bloc_architecture/src/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle appBarTextStyleTheme(bool isDark) =>
      TextStyle(color: isDark ? AppColors.white : AppColors.black);
}
