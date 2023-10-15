// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';

import 'SizeBox_Widget.dart';

//ElevatedButtonText
Widget KeleButtonText({
  required text,
  double? h,
  double? w,
  required onPressed,
  double? tSize,
  tColor,
  tWeight,
  backgroundColor = Colors.blue,
  clipBehavior = Clip.none,
}) {
  return KsBox(
    h: h,
    w: w,
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor, // Background color
        ),
        clipBehavior: clipBehavior,
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: tSize, color: tColor, fontWeight: tWeight),
        )),
  );
}

//ElevatedButtonIcon
Widget KeleButtonIcon({
  required icon,
  h,
  w,
  required onPressed,
  isize,
  icolor,
  backgroundColor = Colors.blue,
  clipBehavior = Clip.none,
}) {
  return KsBox(
    h: h,
    w: w,
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor, // Background color
        ),
        clipBehavior: clipBehavior,
        onPressed: onPressed,
        child: Icon(
          icon,
          size: isize,
          color: icolor,
        )),
  );
}
