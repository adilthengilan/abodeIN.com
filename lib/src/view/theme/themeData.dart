import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
        background: Color.fromARGB(255, 255, 255, 255),
        primary: Colors.black,
        secondary: Color.fromARGB(255, 216, 216, 216)));

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: Colors.white,
      secondary: Color.fromARGB(255, 42, 42, 42),
      background: Color.fromARGB(255, 38, 38, 38),
    ));
