// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';

Widget KsBox({double? h, double? w, child}) {
  return SizedBox(
    height: h,
    width: w,
    child: child,
  );
}
