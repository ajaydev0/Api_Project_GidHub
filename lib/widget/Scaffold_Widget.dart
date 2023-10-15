// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';

Widget KScaffold({body, drawer, extendBody, key, endDrawer}) {
  return Scaffold(
    endDrawer: endDrawer,
    key: key,
    extendBody: extendBody,
    drawer: drawer,
    appBar: AppBar(
      toolbarHeight: 0,
      elevation: 0,
      backgroundColor: Colors.black,
    ),
    body: body,
  );
}
