// ignore_for_file: file_names
import 'package:api_project/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app/modules/MainApp/controllers/main_app_controller.dart';

void showSnackMessage({
  required String title,
  required String message,
  Color? tcolor,
  required int seconds,
}) {
  final istheme = Get.put(MainAppController());
  Get.snackbar(
    title,
    message,
    duration: Duration(seconds: seconds),
    colorText: istheme.theme.value ? Kcolor.black : Kcolor.white,
  );
}
