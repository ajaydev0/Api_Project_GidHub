import 'package:api_project/app/modules/MainApp/views/main_app_view.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MainAppView());
}
