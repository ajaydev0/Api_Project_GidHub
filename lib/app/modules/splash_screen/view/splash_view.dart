import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../MainApp/controllers/main_app_controller.dart';
import '../controller/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    final istheme = Get.put(MainAppController());
    return Scaffold(
      body: Center(
          child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            istheme.theme.value
                ? Container(
                    height: 120,
                    width: 120,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage("assets/images/github_dark.png"))),
                  )
                : Container(
                    height: 120,
                    width: 120,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage("assets/images/github_white.png"))),
                  ),
            const SizedBox(height: 25),
            SizedBox(
                height: 30,
                width: 30,
                child: FittedBox(
                    child: CupertinoActivityIndicator(
                  color: istheme.theme.value ? Colors.black : Colors.white,
                )))
          ],
        ),
      )),
    );
  }
}
