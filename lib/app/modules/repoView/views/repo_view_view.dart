import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/repo_view_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RepoViewView extends GetView<RepoViewController> {
  const RepoViewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(RepoViewController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('RepoView Page'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Obx(
            () => controller.webLoading.value < 1
                ? LinearProgressIndicator(
                    value: controller.webLoading.value,
                  )
                : Container(),
          ),
          Expanded(child: WebViewWidget(controller: controller.controller)),
        ],
      ),
    );
  }
}
