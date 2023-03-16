import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  static ThemeData getLightTheme() => ThemeData(
      colorScheme: ColorScheme.light(
        primary: AppColors.mainColor,
      ),
      brightness: Brightness.light,
      textTheme: textTheme(),
      scaffoldBackgroundColor: AppColors.backgroundColor);

  static ThemeData getDarkTheme(BuildContext context) => ThemeData(
      colorScheme: ColorScheme.dark(
        primary: AppColors.mainColor,
      ),
      fontFamily: 'WorkSans',
      brightness: Brightness.dark,
      textTheme: textTheme(isDark: true),
      scaffoldBackgroundColor: Colors.black);

  static TextTheme textTheme({bool
      isDark = false}) {
    return TextTheme(
      labelMedium: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 22,
        letterSpacing: 0.2,
        height: 0.9,
        color: AppColors.mainColor,
      ),
      labelLarge: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 22,
        letterSpacing: 0.2,
        height: 0.9,
        color: AppColors.backgroundColor,
      ),
       headlineLarge:TextStyle(
         fontWeight: FontWeight.bold,
         fontSize: 35,
         letterSpacing: 0.1,
         height: 0.9,
         color: AppColors.mainColor,
       ) ,

        headlineMedium:TextStyle(
         fontWeight: FontWeight.bold,
         fontSize: 23,
         letterSpacing: 0.1,
         height: 0.9,
         color: AppColors.mainColor,
       ) ,

        headlineSmall:TextStyle(
         fontWeight: FontWeight.bold,
         fontSize: 20,
         letterSpacing: 0.1,
         height: 0.9,
         color: AppColors.mainColor,
       ) ,
        bodyLarge: TextStyle(

          fontWeight: FontWeight.normal,
          fontSize: 25,
          letterSpacing: 0.1,
          height: 0.9,
          color: isDark ? AppColors.backgroundColor : AppColors.darkColor,
        ),
        bodyMedium: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 22,
          letterSpacing: 0.2,
          height: 0.9,
          color: isDark ? AppColors.backgroundColor :AppColors.darkColor,
        ),
        bodySmall: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 16,
          letterSpacing: 0.1,
          height: 0.9,
          color: isDark ? AppColors.backgroundColor :AppColors.darkColor,
        ),
        titleLarge: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 42,
          letterSpacing: 0.4,
          height: 0.9,
          color: isDark ? AppColors.backgroundColor :AppColors.darkColor,
        ) ,
        titleMedium: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize:29 ,
          letterSpacing: 0.4,
          height: 0.9,
          color: isDark ? AppColors.backgroundColor :AppColors.darkColor,
        ),
        titleSmall: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize:25 ,
          letterSpacing: 0.4,
          height: 0.9,
          color: isDark ? AppColors.backgroundColor :AppColors.darkColor,
        ));
  }
}
