// ignore_for_file: file_names
import 'package:flutter/material.dart';

class KtextFeild extends StatelessWidget {
  const KtextFeild({
    super.key,
    required this.hintText,
    required this.labelText,
    this.obscureText = false,
    this.prefixIcon,
    this.prefixIconColor,
    this.maxLength,
    this.suffixIcon,
    this.validator,
    required this.controller,
    this.counterText,
  });
  final String hintText;
  final String labelText;
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
    return TextFormField(
      obscureText: obscureText,
      validator: validator,
      maxLength: maxLength,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        prefixIconColor: prefixIconColor,
        hintText: hintText,
        counterText: counterText,
        labelText: labelText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(color: Colors.blue)),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}

//New

//

//

// import 'package:demo/utils/Ui_Content.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../app/modules/auth/sign_in/controller/sign_in _controller.dart';

// final controller = Get.put(SignInController());

// class KtextFeild extends StatefulWidget {

//   const KtextFeild({super.key, onChanged,
//     hintText = "Enter Anything",
//     labelText = "Email or username",
//     prefixIcon = Icons.person,
//     suffixIcon,
//     validator,
//     controller,
//     maxLength,
//     prefixIconColor,
//     hintTextColor,
//     readOnly = false,
//     maxLengthEnforcement,
//     obscureText = false,
//     autovalidateMode = AutovalidateMode.onUserInteraction,
//     border,
//     prefixIconSize});

//   @override
//   State<KtextFeild> createState() => _KtextFeildState();
// }

// class _KtextFeildState extends State<KtextFeild> {

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//     readOnly: readOnly,
//     onChanged: onChanged,
//     obscureText: obscureText,
//     maxLengthEnforcement: maxLengthEnforcement,
//     maxLength: maxLength,
//     controller: controller,
//     validator: validator,
//     autovalidateMode: autovalidateMode,
//     decoration: InputDecoration(
//       prefixIconColor: appcolors.mainColor,
//       enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(10),
//           ),
//           borderSide: BorderSide(color: appcolors.mainColor)),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(10),
//         ),
//       ),
//       hintText: hintText,
//       hintStyle: TextStyle(color: hintTextColor),
//       labelText: labelText,
//       prefixIcon: Icon(
//         prefixIcon,
//         size: prefixIconSize,
//         color: prefixIconColor,
//       ),
//       suffixIcon: suffixIcon,
//     ),
//   );
//   }
// }

// Widget KtextField(
//    ) {
//   return
// }

// //2
Widget KtextField2(
    {onChanged,
    hintText = "Enter Anything",
    labelText = "Email or username",
    prefixIcon = Icons.person,
    suffixIcon,
    validator,
    controller,
    maxLength,
    prefixIconColor,
    hintTextColor,
    readOnly = false,
    maxLengthEnforcement,
    obscureText = false,
    autovalidateMode = AutovalidateMode.onUserInteraction,
    border,
    prefixIconSize}) {
  return TextFormField(
      readOnly: readOnly,
      decoration: InputDecoration(
          prefixIcon: Icon(
            prefixIcon,
            color: prefixIconColor,
          ),
          border: border,
          hintStyle: TextStyle(color: hintTextColor),
          hintText: hintText));
}
