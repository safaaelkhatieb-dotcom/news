import 'package:flutter/material.dart';
import 'package:news_app/utils/app_styles.dart';
import 'app_colors.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.blackColor,
    scaffoldBackgroundColor: AppColors.blackColor,
    splashColor: AppColors.whiteColor,
    highlightColor: AppColors.whiteColor,
    textTheme: TextTheme(
      displayLarge: AppStyles.bold16Black,
      headlineMedium: AppStyles.MidWhitet24,
      bodyMedium: AppStyles.MidWhitet14,
      bodyLarge: AppStyles.bold16White,
      labelMedium: AppStyles.MidBlackt24
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.blackColor,
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: Colors.white70,
      type: BottomNavigationBarType.fixed,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.blackColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
        side: BorderSide(color: AppColors.whiteColor, width: 3),
      ),
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.whiteColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    splashColor: AppColors.blackColor,
    textTheme: TextTheme(
        displayLarge: AppStyles.bold16White,
      headlineMedium: AppStyles.MidBlackt24,
      bodyMedium: AppStyles.MidBlackt14,
      bodyLarge: AppStyles.bold16Black,
      labelMedium: AppStyles.MidWhitet24
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(

      backgroundColor: AppColors.blackColor,
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: Colors.white70,
      type: BottomNavigationBarType.fixed,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.blackColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
        side: BorderSide(color: AppColors.whiteColor, width: 3),
      ),
    ),
  );
}
