import 'package:flutter/material.dart';
import '../const/colors.dart';

ThemeData darkTheme = ThemeData(
  iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(iconColor: MaterialStatePropertyAll(Kcolor.white))),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    backgroundColor: Kcolor.black,
  )),
  primaryColor: Kcolor.black,
  appBarTheme: AppBarTheme(
      backgroundColor: Kcolor.black,
      titleTextStyle: TextStyle(color: Kcolor.white),
      iconTheme: IconThemeData(
        color: Kcolor.white,
      )),
  scaffoldBackgroundColor: Kcolor.black,
  textTheme: TextTheme(
    headline1: TextStyle(color: Kcolor.white),
    headline2: TextStyle(color: Kcolor.white),
    headline3: TextStyle(color: Kcolor.white),
    headline4: TextStyle(color: Kcolor.white),
    headline5: TextStyle(color: Kcolor.white),
    headline6: TextStyle(color: Kcolor.white),
    bodyText1: TextStyle(color: Kcolor.white),
    bodyText2: TextStyle(color: Kcolor.white),
  ),
);
