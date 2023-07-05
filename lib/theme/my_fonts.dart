import 'package:flutter/material.dart';

class MyFonts
{
  // return the right font depending on app language
  static TextStyle get getAppFontType => const TextStyle(fontFamily: 'LamaSans');
  // headlines text font
  static TextStyle get displayTextStyle => getAppFontType;

  // body text font
  static TextStyle get bodyLarge => getAppFontType;

  // button text font
  static TextStyle get buttonTextStyle => getAppFontType;

  // app bar text font
  static TextStyle get appBarTextStyle  => getAppFontType;

  // chips text font
  static TextStyle get chipTextStyle  => getAppFontType;

  // appbar font size
  static double get appBarTittleSize => 18;

  // body font size
  static double get bodyLargeTextSize => 14;
  static double get bodyMediumTextSize => 13;

  // headlines font size
  static double get displayLargeTextSize => 50;
  static double get displayMediumTextSize => 40;
  static double get displaySmallTextSize => 30;
  static double get headlineMediumTextSize => 25;
  static double get headlineSmallTextSize => 20;
  static double get titleLargeTextSize => 17;

  //button font size
  static double get buttonTextSize => 16;

  //caption font size
  static double get captionTextSize => 13;

  //chip font size
  static double get chipTextSize => 15;
}