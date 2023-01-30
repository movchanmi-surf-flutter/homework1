import 'package:flutter/material.dart';

abstract class AppThemes{
  static ThemeData lightTheme = ThemeData(
    backgroundColor: Color(0xFFF5F5F5), iconTheme: const IconThemeData(
        color: Color(0xFF252849),
      ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: Colors.black,
    ),
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0.0,
      shadowColor: Colors.transparent,
    ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Color(0xFF252849),
        unselectedItemColor: Color(0xFF3B3E5B),
      ),
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: Color(0xFF7C7E92),
      labelColor:  Color(0xFF3B3E5B),
      labelStyle: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
    ),
      textTheme: const TextTheme(
          headline1: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 32,
          ),
          headline2: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
          headline3: TextStyle(
            color: Color(0xFF7C7E92),
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
          headline4: TextStyle(
            color: Color.fromRGBO(124, 126, 146, 0.56),
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          headline5: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          )
      ),
    fontFamily: 'Roboto'
  );

  static ThemeData darkTheme = ThemeData(
      backgroundColor: const Color(0xFF3B3F5B),
    fontFamily: 'Roboto',
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Colors.white,
      ),
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      color: Color(0xFF21222C),elevation:0.0,shadowColor: Colors.transparent
    ),
    scaffoldBackgroundColor: const Color(0xFF21222C),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(0.3),
      backgroundColor: const Color(0xFF252849),
    ),
      textTheme: const TextTheme(
        headline1: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 32,
        ),
        headline2: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 24,
        ),
        headline3: TextStyle(
          color: Color(0xFF7C7E92),
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
        headline4: TextStyle(
          color: Color.fromRGBO(124, 126, 146, 0.56),
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        headline5: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        )
  ),

    tabBarTheme: TabBarTheme(
      unselectedLabelColor: Color(0xFF7C7E92),
      labelColor: Colors.white,
      labelStyle: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
    )
  );
}