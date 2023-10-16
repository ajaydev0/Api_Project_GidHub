import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../themes/light_theme.dart';
import '../../../../themes/dark_theme.dart';
import '../../../router/app_pages.dart';
import '../controllers/main_app_controller.dart';

class MainAppView extends GetView<MainAppController> {
  const MainAppView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(MainAppController());
    return GetMaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initialPage,
      getPages: AppPages.pages,
    );
  }
}
