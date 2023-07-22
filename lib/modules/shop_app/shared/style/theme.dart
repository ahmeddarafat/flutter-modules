import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    backgroundColor: Colors.white,
    elevation: 0,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: Colors.black,
    ),
    headlineMedium: TextStyle(
      color: Colors.black,
    ),
  ),
);
ThemeData darkTheme = ThemeData(
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: Colors.white,
    ),
    headlineMedium: TextStyle(
      color: Colors.white,
    ),
  ),
  scaffoldBackgroundColor: Colors.black,
);
