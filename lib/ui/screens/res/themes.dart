import 'package:flutter/material.dart';
import 'package:places/ui/screens/res/app_typography.dart';
import 'package:places/ui/screens/res/colors.dart';

abstract class AppThemes {
  static ThemeData lightTheme = ThemeData(
      iconTheme: const IconThemeData(
        color: AppColors.darkGray,
      ),
      sliderTheme: SliderThemeData(
          activeTrackColor: AppColors.green,
          thumbColor: AppColors.white,
          trackHeight: 2,
          overlayColor: AppColors.green.withOpacity(0.1),
          inactiveTrackColor: AppColors.lightGray.withOpacity(0.56)),
      buttonTheme: const ButtonThemeData(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      indicatorColor: AppColors.green,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.black,
      ),
      appBarTheme: const AppBarTheme(
        color: AppColors.white,
        elevation: 0.0,
        shadowColor: Colors.transparent,
      ),
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.white,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColors.darkGray,
        unselectedItemColor: AppColors.darkGray,
      ),
      tabBarTheme: const TabBarTheme(
        unselectedLabelColor: AppColors.lightGray,
        labelColor: AppColors.darkGray,
        labelStyle: AppTypography.headline3,
      ),
      textTheme: TextTheme(
          displayLarge: AppTypography.headline1,
          displayMedium: AppTypography.headline2,
          displaySmall:
              AppTypography.headline3.copyWith(color: AppColors.white),
          headlineMedium: AppTypography.headline4,
          headlineSmall:
              AppTypography.headline4.copyWith(color: AppColors.black)),
      fontFamily: 'Roboto',
      colorScheme: const ColorScheme(
        background: AppColors.milkWhite,
        brightness: Brightness.light,
        primary: AppColors.milkWhite,
        onPrimary: AppColors.milkWhite,
        secondary: AppColors.milkWhite,
        onSecondary: AppColors.milkWhite,
        error: Colors.red,
        onError: Colors.red,
        onBackground: AppColors.white,
        surface: Colors.transparent,
        onSurface: Colors.transparent,
      ));

  static ThemeData darkTheme = ThemeData(
      colorScheme: const ColorScheme(
        background: AppColors.backGray,
        brightness: Brightness.dark,
        primary: AppColors.darkGray,
        onPrimary: AppColors.darkGray,
        secondary: AppColors.darkGray,
        onSecondary: AppColors.darkGray,
        error: Colors.red,
        onError: Colors.red,
        onBackground: AppColors.backGray,
        surface: Colors.transparent,
        onSurface: Colors.transparent,
      ),
      indicatorColor: AppColors.green,
      fontFamily: 'Roboto',
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.white,
      ),
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
          color: AppColors.preBlack,
          elevation: 0.0,
          shadowColor: Colors.transparent),
      scaffoldBackgroundColor: AppColors.preBlack,
      iconTheme: const IconThemeData(
        color: AppColors.white,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.white.withOpacity(0.3),
        backgroundColor: AppColors.darkGray,
      ),
      buttonTheme: const ButtonThemeData(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      textTheme: TextTheme(
          displayLarge:
              AppTypography.headline1.copyWith(color: AppColors.white),
          displayMedium:
              AppTypography.headline2.copyWith(color: AppColors.white),
          displaySmall:
              AppTypography.headline3.copyWith(color: AppColors.lightGray),
          headlineMedium:
              AppTypography.headline4.copyWith(color: AppColors.white),
          headlineSmall:
              AppTypography.headline4.copyWith(color: AppColors.white)),
      tabBarTheme: const TabBarTheme(
        unselectedLabelColor: AppColors.lightGray,
        labelColor: AppColors.white,
        labelStyle: AppTypography.headline4,
      ));
}
