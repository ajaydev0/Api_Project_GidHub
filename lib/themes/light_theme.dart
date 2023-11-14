import 'package:api_project/const/colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(iconColor: MaterialStatePropertyAll(Kcolor.black))),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      backgroundColor: Kcolor.white,
    )),
    primaryColor: Kcolor.white,
    appBarTheme: AppBarTheme(
        backgroundColor: Kcolor.white,
        titleTextStyle: TextStyle(color: Kcolor.black),
        iconTheme: IconThemeData(color: Kcolor.black)),
    scaffoldBackgroundColor: Kcolor.white,
    textTheme: TextTheme(
      headline1: TextStyle(color: Kcolor.black),
      headline2: TextStyle(color: Kcolor.black),
      headline3: TextStyle(color: Kcolor.black),
      headline4: TextStyle(color: Kcolor.black),
      headline5: TextStyle(color: Kcolor.black),
      headline6: TextStyle(color: Kcolor.black),
      bodyText1: TextStyle(color: Kcolor.black),
      bodyText2: TextStyle(color: Kcolor.black),
    ));
