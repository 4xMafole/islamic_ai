// lib/themes/app_theme.dart
import 'package:flutter/material.dart';
import 'package:islamic_ai/features/theme/theme.dart';

class IAITheme {
  static ThemeData lightTheme() {
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: IAIColor.whiteColor,
      primaryColor: IAIColor.deepBlue,
      accentColor: IAIColor.deepBlue,
      appBarTheme: const AppBarTheme(
        backgroundColor: IAIColor.deepBlue,
        titleTextStyle: TextStyle(color: IAIColor.whiteColor),
      ),
      textTheme: ThemeData.light().textTheme.apply(
            fontFamily: 'Poppins',
          ),
      primaryTextTheme: ThemeData.light().primaryTextTheme.apply(
            fontFamily: 'Poppins',
          ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: IAIColor.primaryBackground,
      primaryColor: Colors.deepPurple,
      accentColor: Colors.deepPurpleAccent,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.deepPurple,
        titleTextStyle: TextStyle(color: IAIColor.whiteColor),
      ),
      textTheme: ThemeData.dark().textTheme.apply(
            fontFamily: 'Poppins',
            bodyColor: IAIColor.whiteColor,
            displayColor: IAIColor.whiteColor,
          ),
      primaryTextTheme: ThemeData.dark().primaryTextTheme.apply(
            fontFamily: 'Poppins',
            bodyColor: IAIColor.whiteColor,
            displayColor: IAIColor.whiteColor,
          ),
    );
  }
}
