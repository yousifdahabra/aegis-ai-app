import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.mainTitleColor,
      scaffoldBackgroundColor: AppColors.backgroundPageColor,
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontFamily: AppFonts.mainTitleFont,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.mainTitleColor,
        ),
        headlineSmall: TextStyle(
          fontFamily: AppFonts.subTitleFont,
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColors.mainTitleColor,
        ),
      ),
    );
  }
}
