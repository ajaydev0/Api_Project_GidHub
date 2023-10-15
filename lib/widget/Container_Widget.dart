// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';

Widget Kcontainer(
    {double? h,
    double? w,
    child,
    decoration,
    color,
    padding,
    margin,
    alignment}) {
  return Container(
    height: h,
    width: w,
    child: child,
    decoration: decoration,
    color: color,
    padding: padding,
    margin: margin,
    alignment: alignment,
  );
}
