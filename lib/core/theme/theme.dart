import 'package:flutter/material.dart';

class MyTheme {
  //******Dark theme**** *//
  static final darkTheme = ThemeData(
    errorColor: Colors.red,
    // buttonTheme: ,
    primaryColorDark: Colors.green,
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.black,
    fontFamily: 'BentonSans',
    colorScheme: const ColorScheme.dark(),
    appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(color: Colors.white),
        iconTheme: IconThemeData(color: Colors.white)),
  );

  //******Light theme**** *//
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0Xffedede9),
    fontFamily: 'BentonSans',
    colorScheme: const ColorScheme.light(),
    appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(color: Colors.black),
        iconTheme: IconThemeData(color: Colors.black)),
  );
}
