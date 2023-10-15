import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../widget/AppSize_MediaQuery.dart';

import '../../../../../widget/SizeBox_Widget.dart';
import '../../../../../widget/TextField_Widget.dart';
import '../../../../../widget/Text_Widget.dart';
import '../controller/sign_in_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In Page'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl:
                      "https://images.pexels.com/photos/5218003/pexels-photo-5218003.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                  imageBuilder: (context, imageProvider) => Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                KsBox(h: Kh(context: context, value: 5)),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: KtextFeild(
                    controller: controller.inputEmail,
                    validator: (value) {
                      return controller.validateEmail(value);
                    },
                    hintText: "USER ID",
                    labelText: "USER ID",
                  ),
                ),
                KsBox(h: Kh(context: context, value: 2)),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: Obx(
                    () => KtextFeild(
                        controller: controller.inputPass,
                        obscureText: controller.passwordVisible.value,
                        validator: (value) {
                          return controller.validatePass(value);
                        },
                        suffixIcon: IconButton(
                          icon: Icon(controller.passwordVisible.value
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            controller.passwordVisible.value =
                                !controller.passwordVisible.value;
                          },
                        ),
                        // suffixIconColor: Colors.red,
                        hintText: "PASSWORD",
                        labelText: "PASSWORD"),
                  ),
                ),
                KsBox(h: Kh(context: context, value: 1)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Ktext(
                      text: "forgot password",
                      // fontStyle: FontStyle.italic,
                      // weight: FontWeight.bold,
                      size: 12,
                    ),
                    KsBox(w: 50),
                  ],
                ),
                KsBox(h: Kh(context: context, value: 4)),
                ElevatedButton(
                    onPressed: () {
                      controller.signInClick(context, controller);
                    },
                    child: Text("Sign In")),
                // GestureDetector(
                //   onTap: () {
                //     // controller.logInClick(context, controller);
                //   },
                //   child: Kcontainer(
                //     h: 50,
                //     w: 170,
                //     decoration: BoxDecoration(
                //       boxShadow: [
                //         BoxShadow(
                //           blurRadius: 20.0,
                //           offset: const Offset(0, 5),
                //           // color: appcolors.redWithOpacity
                //         ),
                //       ],
                //       borderRadius: BorderRadius.circular(15),
                //       gradient: const LinearGradient(
                //         begin: Alignment.topLeft,
                //         end: Alignment(0.8, 1),
                //         colors: [
                //           Color.fromARGB(255, 228, 14, 14),
                //           Color.fromARGB(255, 150, 3, 3),
                //           Color.fromARGB(255, 100, 2, 2),
                //         ],
                //         tileMode: TileMode.mirror,
                //       ),
                //     ),
                //     child: Center(
                //         child: Ktext(
                //       text: "LOGIN",
                //       color: Colors.white,
                //       // letterSpacing: 0.5,
                //     )),
                //   ),
                // ),
                KsBox(
                  h: Kh(context: context, value: 2),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Ktext(
                      text: "Don't have an account!",
                      color: Colors.black,
                      weight: FontWeight.bold,
                    ),
                    // KsBox(w: Kw(context: context, value: 1)),
                    TextButton(
                      onPressed: () {
                        // controller.goSignUp();
                      },
                      child: Ktext(
                          text: "SIGNUP",
                          // color: appcolors.red,
                          weight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
