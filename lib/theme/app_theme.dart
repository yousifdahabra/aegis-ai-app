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
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.mainTitleColor,
        ), //intro title app
        displayMedium: TextStyle(
          fontFamily: AppFonts.mainTitleFont,
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: AppColors.mainTitleColor,
        ), //title
        displaySmall: TextStyle(
          fontFamily: AppFonts.subTitleFont,
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColors.fillButtonColor,
        ), //btn
        headlineSmall: TextStyle(
          fontFamily: AppFonts.subTitleFont,
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: AppColors.labelColor,
        ), //Label
        headlineMedium: TextStyle(
          fontFamily: AppFonts.subTitleFont,
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: AppColors.labelColor,
        ), //data table
        labelLarge: TextStyle(
          fontFamily: AppFonts.subTitleFont,
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: AppColors.fillTextInputColor,
        ), //for table title

        labelSmall: TextStyle(
          fontFamily: AppFonts.subTitleFont,
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: AppColors.labelColor,
        ), //active navbar
        bodyLarge: TextStyle(
          fontFamily: AppFonts.subTitleFont,
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColors.fillTextInputColor,
        ), //inside input
        bodyMedium: TextStyle(
          fontFamily: AppFonts.subTitleFont,
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: AppColors.linksColor,
        ), // link
        bodySmall: TextStyle(
          fontFamily: AppFonts.subTitleFont,
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: AppColors.fillTextInputColor,
        ), //not active navbar
        titleMedium: TextStyle(
          fontFamily: AppFonts.subTitleFont,
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: AppColors.labelColor,
        ),
        titleSmall: TextStyle(
          fontFamily: AppFonts.subTitleFont,
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: AppColors.subIntroColor,
        ), //for sub intro
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
