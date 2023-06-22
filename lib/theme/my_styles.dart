import 'package:flutter/material.dart';
import 'dark_theme_colors.dart';
import 'my_fonts.dart';
import 'light_theme_colors.dart';

class MyStyles {
  ///icons theme
  static IconThemeData getIconTheme({required bool isLightTheme}) =>
      IconThemeData(
        color: isLightTheme
            ? LightColors.iconColor
            : DarkThemeColors.iconColor,
      );

  ///app bar theme
  static AppBarTheme getAppBarTheme({required bool isLightTheme}) =>
      AppBarTheme(
        elevation: 0,
        titleTextStyle:
            getTextTheme(isLightTheme: isLightTheme).bodyLarge!.copyWith(
                  color: LightColors.toolbarTextColor,
                  fontSize: MyFonts.appBarTittleSize,
                ),
        iconTheme: IconThemeData(
            color: isLightTheme
                ? LightColors.appBarIconsColor
                : DarkThemeColors.appBarIconsColor),
        backgroundColor: isLightTheme
            ? LightColors.appBarColor
            : DarkThemeColors.appbarColor,
      );

  ///text theme
  static TextTheme getTextTheme({required bool isLightTheme}) => TextTheme(
        labelLarge: MyFonts.buttonTextStyle
            .copyWith(fontSize: MyFonts.buttonTextSize),
        bodyLarge: (MyFonts.bodyLarge).copyWith(
            fontWeight: FontWeight.bold,
            fontSize: MyFonts.bodyLargeTextSize,
            color: isLightTheme
                ? LightColors.bodyTextColor
                : DarkThemeColors.bodyTextColor),
        bodyMedium: (MyFonts.bodyLarge).copyWith(
            fontSize: MyFonts.bodyMediumTextSize,
            color: isLightTheme
                ? LightColors.bodyTextColor
                : DarkThemeColors.bodyTextColor),
        displayLarge: (MyFonts.displayTextStyle).copyWith(
            fontSize: MyFonts.displayLargeTextSize,
            fontWeight: FontWeight.bold,
            color: isLightTheme
                ? LightColors.headlinesTextColor
                : DarkThemeColors.headlinesTextColor),
        displayMedium: (MyFonts.displayTextStyle).copyWith(
            fontSize: MyFonts.displayMediumTextSize,
            fontWeight: FontWeight.bold,
            color: isLightTheme
                ? LightColors.headlinesTextColor
                : DarkThemeColors.headlinesTextColor),
        displaySmall: (MyFonts.displayTextStyle).copyWith(
            fontSize: MyFonts.displaySmallTextSize,
            fontWeight: FontWeight.bold,
            color: isLightTheme
                ? LightColors.headlinesTextColor
                : DarkThemeColors.headlinesTextColor),
        headlineMedium: (MyFonts.displayTextStyle).copyWith(
            fontSize: MyFonts.headlineMediumTextSize,
            fontWeight: FontWeight.bold,
            color: isLightTheme
                ? LightColors.headlinesTextColor
                : DarkThemeColors.headlinesTextColor),
        headlineSmall: (MyFonts.displayTextStyle).copyWith(
            fontSize: MyFonts.headlineSmallTextSize,
            fontWeight: FontWeight.bold,
            color: isLightTheme
                ? LightColors.headlinesTextColor
                : DarkThemeColors.headlinesTextColor),
        titleLarge: (MyFonts.displayTextStyle).copyWith(
            fontSize: MyFonts.titleLargeTextSize,
            fontWeight: FontWeight.bold,
            color: isLightTheme
                ? LightColors.headlinesTextColor
                : DarkThemeColors.headlinesTextColor),
        bodySmall: TextStyle(
            color: isLightTheme
                ? LightColors.captionTextColor
                : DarkThemeColors.captionTextColor,
            fontSize: MyFonts.captionTextSize),
      );

  static ChipThemeData getChipTheme({required bool isLightTheme}) {
    return ChipThemeData(
      backgroundColor: isLightTheme
          ? LightColors.chipBackground
          : DarkThemeColors.chipBackground,
      brightness: Brightness.light,
      labelStyle: getChipTextStyle(isLightTheme: isLightTheme),
      secondaryLabelStyle: getChipTextStyle(isLightTheme: isLightTheme),
      selectedColor: Colors.black,
      disabledColor: Colors.green,
      elevation: 5,
      padding: const EdgeInsets.all(5),
      secondarySelectedColor: Colors.purple,
    );
  }

  ///Chips text style
  static TextStyle getChipTextStyle({required bool isLightTheme}) {
    return MyFonts.chipTextStyle.copyWith(
      fontSize: MyFonts.chipTextSize,
      color: isLightTheme
          ? LightColors.chipTextColor
          : DarkThemeColors.chipTextColor,
    );
  }

  // elevated button text style
  static MaterialStateProperty<TextStyle?>? getElevatedButtonTextStyle(
      bool isLightTheme,
      {bool isBold = true,
      double? fontSize}) {
    return MaterialStateProperty.resolveWith<TextStyle>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
          return MyFonts.buttonTextStyle.copyWith(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontSize: fontSize ?? MyFonts.buttonTextSize,
              color: isLightTheme
                  ? LightColors.buttonTextColor
                  : DarkThemeColors.buttonTextColor);
        } else if (states.contains(MaterialState.disabled)) {
          return MyFonts.buttonTextStyle.copyWith(
              fontSize: fontSize ?? MyFonts.buttonTextSize,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: isLightTheme
                  ? LightColors.buttonDisabledTextColor
                  : DarkThemeColors.buttonDisabledTextColor);
        }
        return MyFonts.buttonTextStyle.copyWith(
            fontSize: fontSize ?? MyFonts.buttonTextSize,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: isLightTheme
                ? LightColors.buttonTextColor
                : DarkThemeColors
                    .buttonTextColor); // Use the component's default.
      },
    );
  }

  //elevated button theme data
  static ElevatedButtonThemeData getElevatedButtonTheme(
          {required bool isLightTheme}) =>
      ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
              //side: BorderSide(color: Colors.teal, width: 2.0),
            ),
          ),
          elevation: MaterialStateProperty.all(0),
          padding:
              MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(vertical: 8)),
          textStyle: getElevatedButtonTextStyle(isLightTheme),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return isLightTheme
                    ? LightColors.buttonColor.withOpacity(0.5)
                    : DarkThemeColors.buttonColor.withOpacity(0.5);
              } else if (states.contains(MaterialState.disabled)) {
                return isLightTheme
                    ? LightColors.buttonDisabledColor
                    : DarkThemeColors.buttonDisabledColor;
              }
              return isLightTheme
                  ? LightColors.buttonColor
                  : DarkThemeColors.buttonColor; // Use the component's default.
            },
          ),
        ),
      );
}
