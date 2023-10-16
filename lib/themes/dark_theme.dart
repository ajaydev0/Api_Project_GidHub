import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(iconColor: MaterialStatePropertyAll(Colors.white))),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    backgroundColor: Colors.black,
  )),
  primaryColor: Colors.black,
  appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      titleTextStyle: TextStyle(color: Colors.white),
      iconTheme: IconThemeData(
        color: Colors.white,
      )),
  scaffoldBackgroundColor: Colors.black,
  textTheme: const TextTheme(
    headline1: TextStyle(color: Colors.white),
    headline2: TextStyle(color: Colors.white),
    headline3: TextStyle(color: Colors.white),
    headline4: TextStyle(color: Colors.white),
    headline5: TextStyle(color: Colors.white),
    headline6: TextStyle(color: Colors.white),
    bodyText1: TextStyle(color: Colors.white),
    bodyText2: TextStyle(color: Colors.white),
  ),
);
