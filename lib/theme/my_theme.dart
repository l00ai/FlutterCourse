import 'package:flutter/material.dart';
import 'package:my_applecation/my_shared_perf.dart';
import 'dark_theme_colors.dart';
import 'light_theme_colors.dart';
import 'my_styles.dart';

class MyTheme {

  static getThemeData({required bool isLight}){
    return ThemeData(
        // main color (app bar,tabs..etc)
        primaryColor: isLight ? LightColors.primaryColor : DarkThemeColors.primaryColor,
        // color contrast (if the theme is dark text should be white for example)
        brightness: isLight ? Brightness.light : Brightness.dark,
        // card widget background color
        cardColor: isLight ? LightColors.cardColor : DarkThemeColors.cardColor,
        // hint text color
        hintColor: isLight ? LightColors.hintTextColor : DarkThemeColors.hintTextColor,
        // divider color
        dividerColor: isLight ? LightColors.dividerColor : DarkThemeColors.dividerColor,
        // app background color
        backgroundColor: isLight ? LightColors.backgroundColor : DarkThemeColors.backgroundColor,

        scaffoldBackgroundColor: isLight ? LightColors.scaffoldBackgroundColor : DarkThemeColors.scaffoldBackgroundColor,

        // progress bar theme
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: isLight ? LightColors.primaryColor : DarkThemeColors.primaryColor,
        ),

        // appBar theme
        appBarTheme: MyStyles.getAppBarTheme(isLightTheme: isLight),

        // elevated button theme
        elevatedButtonTheme: MyStyles.getElevatedButtonTheme(isLightTheme: isLight),

        // text theme
        textTheme: MyStyles.getTextTheme(isLightTheme: isLight),

        // chip theme
        chipTheme: MyStyles.getChipTheme(isLightTheme: isLight),

        // icon theme
        iconTheme: MyStyles.getIconTheme(isLightTheme: isLight),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: isLight ? LightColors.accentColor : DarkThemeColors.accentColor),

        // The new way to define accentColor and backgroundColor
        //colorScheme: ColorScheme.fromSwatch().copyWith(secondary: isLight ? LightColors.accentColor : DarkThemeColors.accentColor).copyWith(background: isLight ? LightColors.backgroundColor : DarkThemeColors.backgroundColor),

    );
  }



}