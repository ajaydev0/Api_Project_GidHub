import 'package:api_project/app/router/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserInputController extends GetxController {
  // // Validate Input TextFormFeild
  validateEmail(value) {
    if (value == null || value.trim().isEmpty) {
      return " Required";
    }

    return null;
  }

  // // Search Button Click
  searchClick(context, controller) {
    //Validation Key
    if (controller.formKey.currentState!.validate()) {
      Get.toNamed(Routes.homePage);
    }
  }

  // //Key
  final formKey = GlobalKey<FormState>();

  final TextEditingController inputEmail = TextEditingController();

  @override
  void onClose() {
    inputEmail.dispose();

    super.onClose();
  }
}
