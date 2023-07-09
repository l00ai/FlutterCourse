import 'package:flutter/material.dart';

class Booster {

  static textTitle(BuildContext context, String text, {Color? color,}){
    final theme = Theme.of(context);
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        color: color ?? theme.primaryColor
      ),
    );
  }

  static textSecondaryTitle(BuildContext context, String text, {Color? color,}){
    final theme = Theme.of(context);
    return Text(text,
      textAlign: TextAlign.start,
      style: TextStyle(
          fontSize: 12,
          color: color ?? theme.primaryColor,
          fontWeight: FontWeight.bold,
      ),);
  }

  static textBody(BuildContext context, String text,  {double fontSize = 14.0, Color? color, FontWeight fontWeight = FontWeight.normal,}){
    final theme = Theme.of(context);
    return
     Text(
       text,
      style: TextStyle(
        color: color ?? theme.primaryColor,
        fontSize: fontSize,
        fontWeight: fontWeight
      )
     );
  }


  static horizontalSpace({double width = 10}){
    return SizedBox(width: width,);
  }

  static verticalSpace({double height = 10}){
    return SizedBox(height: height,);
  }

}
