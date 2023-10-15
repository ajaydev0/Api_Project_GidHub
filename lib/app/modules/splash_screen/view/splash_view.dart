import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());

    return const Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.android,
            size: 130,
          ),
          Text(
            "Splash Screen",
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(height: 30),
          SizedBox(
              height: 40,
              width: 40,
              child: FittedBox(child: CupertinoActivityIndicator()))
        ],
      )),
    );
  }
}
