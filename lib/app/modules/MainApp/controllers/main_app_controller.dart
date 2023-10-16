import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../themes/theme_data.dart';

class MainAppController extends GetxController {
  RxBool theme = false.obs;
  @override
  void onInit() {
    checkTheme();
    super.onInit();
  }

  checkTheme() async {
    theme.value = await LocalData().getThemeData();
    Get.changeThemeMode(theme.value ? ThemeMode.light : ThemeMode.dark);
  }

  changeTheme() {
    theme.value = !theme.value;
    LocalData().setThemeData(theme.value);
    Get.changeThemeMode(theme.value ? ThemeMode.light : ThemeMode.dark);
  }
}
