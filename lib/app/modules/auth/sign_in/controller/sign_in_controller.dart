import 'package:api_project/app/router/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  // // Validate Email TextFormFeild
  validateEmail(value) {
    if (value == null || value.trim().isEmpty) {
      return " Required";
    }

    return null;
  }

  // // Validate Password TextFormFeild
  validatePass(value) {
    if (value == null || value.isEmpty) {
      return " Requied";
    }
    return null;
  }

  // // Sign In Button Click
  signInClick(context, controller) {
    //Validation Key
    if (controller.formKey.currentState!.validate()) {
      Get.offAllNamed(Routes.homePage);
    }
  }

  // //Clear Controller Lekha
  // clearData(controller) {
  //   () => controller.inputEmail.clear();
  // }

  // //Go to Sign Up Page
  goSignUp() {
    // Get.offAllNamed(Routes.signUpScreen);
  }

  // //Key
  final formKey = GlobalKey<FormState>();
  RxBool passwordVisible = true.obs;
  final TextEditingController inputEmail = TextEditingController();
  final TextEditingController inputPass = TextEditingController();

  @override
  void onClose() {
    inputEmail.dispose();
    inputPass.dispose();
    super.onClose();
  }
}
