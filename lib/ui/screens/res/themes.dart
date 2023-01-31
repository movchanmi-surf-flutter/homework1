import 'package:flutter/material.dart';
import 'package:places/ui/screens/res/app_typography.dart';
import 'package:places/ui/screens/res/colors.dart';

abstract class AppThemes {
  static ThemeData lightTheme = ThemeData(
      backgroundColor: AppColors.milkWhite,
      iconTheme: const IconThemeData(
        color: AppColors.darkGray,
      ),
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
          headline1: AppTypography.headline1,
          headline2: AppTypography.headline2,
          headline3: AppTypography.headline3.copyWith(color: AppColors.white),
          headline4: AppTypography.headline4,
          headline5: AppTypography.headline4.copyWith(color: AppColors.black)),
      fontFamily: 'Roboto');

  static ThemeData darkTheme = ThemeData(
      backgroundColor: AppColors.backGray,
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
      textTheme: TextTheme(
          headline1: AppTypography.headline1.copyWith(color: AppColors.white),
          headline2: AppTypography.headline2.copyWith(color: AppColors.white),
          headline3:
              AppTypography.headline3.copyWith(color: AppColors.lightGray),
          headline4: AppTypography.headline4,
          headline5: AppTypography.headline4.copyWith(color: AppColors.white)),
      tabBarTheme: const TabBarTheme(
        unselectedLabelColor: AppColors.lightGray,
        labelColor: AppColors.white,
        labelStyle: AppTypography.headline4,
      ));
}
