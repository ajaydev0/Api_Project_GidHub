import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/modules/MainApp/controllers/main_app_controller.dart';

class KtextFeild extends StatelessWidget {
  const KtextFeild({
    super.key,
    this.hintText,
    required this.labelText,
    this.obscureText = false,
    this.prefixIcon,
    this.prefixIconColor,
    this.maxLength,
    this.suffixIcon,
    this.validator,
    required this.controller,
    this.counterText,
    this.cursorColor,
    this.labelStyle,
    this.style,
  });
  final Color? cursorColor;
  final String? hintText;
  final String labelText;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final bool obscureText;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final int? maxLength;
  final String? counterText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final istheme = Get.put(MainAppController());
    return TextFormField(
      style: style,
      cursorColor: istheme.theme.value ? Colors.black : Colors.white,
      obscureText: obscureText,
      validator: validator,
      maxLength: maxLength,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        prefixIconColor: istheme.theme.value ? Colors.black : Colors.white,
        hintText: hintText,
        counterText: counterText,
        labelText: labelText,
        labelStyle: labelStyle,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
            borderSide: BorderSide(
                color: istheme.theme.value ? Colors.black : Colors.white)),
        enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
            borderSide: BorderSide(
                color: istheme.theme.value ? Colors.black : Colors.white)),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
      ),
    );
  }
}
