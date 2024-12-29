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
        labelSmall: TextStyle(
          fontFamily: AppFonts.subTitleFont,
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: AppColors.mainTitleColor,
        ),
        bodyLarge: TextStyle(
          fontFamily: AppFonts.subTitleFont,
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColors.fillTextInputColor,
        ),
        bodyMedium: TextStyle(
          fontFamily: AppFonts.subTitleFont,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.labelColor,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.fillButtonColor,
          foregroundColor: AppColors.fillTextInputColor,
          textStyle: TextStyle(
            fontFamily: AppFonts.subTitleFont,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.fillInputsColor,
        filled: true,
        labelStyle: TextStyle(
          fontFamily: AppFonts.subTitleFont,
          fontSize: 20,
          color: AppColors.labelColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: AppColors.fillInputsColor,
          ),
        ),
      ),
    );
  }
}
