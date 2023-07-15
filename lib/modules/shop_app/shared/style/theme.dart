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
    bodyText1: TextStyle(
      color: Colors.black,
    ),
    headline4: TextStyle(
      color: Colors.black,
    ),
  ),
);
ThemeData darkTheme = ThemeData(
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Colors.white,
    ),
    headline4: TextStyle(
      color: Colors.white,
    ),
  ),
  scaffoldBackgroundColor: Colors.black,
);
