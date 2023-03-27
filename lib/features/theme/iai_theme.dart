// lib/themes/app_theme.dart
import 'package:flutter/material.dart';

class IAITheme {
  static ThemeData lightTheme() {
    return ThemeData.light().copyWith(
      primaryColor: Colors.blue,
      accentColor: Colors.blueAccent,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue,
        titleTextStyle: TextStyle(color: Colors.white),
      ),
      textTheme: ThemeData.light().textTheme.apply(
            fontFamily: 'Poppins',
            bodyColor: Colors.black,
            displayColor: Colors.black,
          ),
      primaryTextTheme: ThemeData.light().primaryTextTheme.apply(
            fontFamily: 'Poppins',
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      primaryColor: Colors.deepPurple,
      accentColor: Colors.deepPurpleAccent,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.deepPurple,
        titleTextStyle: TextStyle(color: Colors.white),
      ),
      textTheme: ThemeData.dark().textTheme.apply(
            fontFamily: 'Poppins',
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
      primaryTextTheme: ThemeData.dark().primaryTextTheme.apply(
            fontFamily: 'Poppins',
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
    );
  }
}