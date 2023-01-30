import 'package:flutter/cupertino.dart';
import 'package:places/ui/screens/res/colors.dart';

abstract class AppTypography {
  static const String _fontFamily = 'Roboto';
  static const TextStyle headline1 = TextStyle(
    color: AppColors.black,
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 32,
  );
  static const TextStyle headline2 = TextStyle(
    color: AppColors.black,
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 24,
  );
  static const TextStyle headline3 = TextStyle(
    color: AppColors.lightGray,
    fontSize: 14,
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle headline4 = TextStyle(
    color: Color.fromRGBO(124, 126, 146, 0.56),
    fontWeight: FontWeight.w400,
    fontFamily: _fontFamily,
    fontSize: 14,
  );
}
