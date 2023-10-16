// ignore_for_file: file_names, non_constant_identifier_names
import 'package:api_project/widget/Container_Widget.dart';
import 'package:flutter/material.dart';
import 'SizeBox_Widget.dart';

//ElevatedButtonText
Widget KeleButtonText({
  required text,
  double? h,
  double? w,
  required onPressed,
  double? tSize,
  Color? tColor,
  Color? backgroundColor,
  tWeight,
  decoration,
  clipBehavior = Clip.none,
}) {
  return Kcontainer(
    h: h,
    w: w,
    decoration: decoration,
    child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(backgroundColor)),
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
  backgroundColor,
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
