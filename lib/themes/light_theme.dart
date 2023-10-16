import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(iconColor: MaterialStatePropertyAll(Colors.black))),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
    )),
    primaryColor: Colors.white,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(color: Colors.black),
        iconTheme: IconThemeData(
          color: Colors.black,
        )),
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      headline1: TextStyle(color: Colors.black),
      headline2: TextStyle(color: Colors.black),
      headline3: TextStyle(color: Colors.black),
      headline4: TextStyle(color: Colors.black),
      headline5: TextStyle(color: Colors.black),
      headline6: TextStyle(color: Colors.black),
      bodyText1: TextStyle(color: Colors.black),
      bodyText2: TextStyle(color: Colors.black),
    ));
