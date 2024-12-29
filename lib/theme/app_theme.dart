import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.mainTitleColor,
      scaffoldBackgroundColor: AppColors.backgroundPageColor,
    );
  }
}
