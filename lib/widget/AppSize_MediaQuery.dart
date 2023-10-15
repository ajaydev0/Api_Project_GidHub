// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';

Kh({required double value, required BuildContext context}) {
  var maxHeight = MediaQuery.of(context).size.height / 100;
  return maxHeight * value;
}

Kw({required double value, required BuildContext context}) {
  var maxWidth = MediaQuery.of(context).size.width / 100;
  return maxWidth * value;
}
