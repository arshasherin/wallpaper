import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomSizes {
  static const double padding = 12.0;
  static const double smallPadding = 7.0;
  static const double largePadding = 17.5;
  static const double cardBorderRadius = 8.0;
  static const double iconSize = 27.0;
  static const double headingTextSize = 24.0;
  static const double cardTextSize = 12.0;
  static const double appBarTextSize = 16.0;
}

class CustomColors {
  static const appBarTextColor = Color(0xffffffff);
  static const headingTextColor = Colors.black;
  static const toastColor = Color(0xFF4CAF50);
  static const primaryColors =  Colors.black;
  static const backgroundColor = Color(0xffffffff);
  static const borderColor = Color(0xfff5f5f5);
  static const greyColor = Color(0xFF757575);
  static const transparentColor = Colors.transparent;
}



void printx(String format, dynamic argument) {
  if (kDebugMode) {
    print('$format $argument');
  }
}
