import 'package:api_project/Utils/snackBar_utils.dart';
import 'package:api_project/app/router/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class UserInputController extends GetxController {
  // Validate Input TextFormFeild
  validateEmail(value) {
    if (value == null || value.trim().isEmpty) {
      return " Required";
    }

    return null;
  }

  // Search Button Click
  Future<dynamic> searchClick(context, controller) async {
    var conectivityResult = await (Connectivity().checkConnectivity());
    //Validation Key
    if (controller.formKey.currentState!.validate()) {
      if (conectivityResult == ConnectivityResult.mobile) {
        print("Connected With (Mobile Data)");
        Get.toNamed(Routes.homePage, arguments: inputEmail.text);
      } else if (conectivityResult == ConnectivityResult.wifi) {
        print("Connected With (WiFi)");
        Get.toNamed(Routes.homePage, arguments: inputEmail.text);
      } else {
        print("No Internet Connected");
        showSnackMessage(
            title: "Error", message: "No Internet Connected", seconds: 1);
        return null;
      }
    }
  }

  //Key
  final formKey = GlobalKey<FormState>();
  final TextEditingController inputEmail = TextEditingController();

  @override
  void onClose() {
    inputEmail.dispose();
    super.onClose();
  }
}
