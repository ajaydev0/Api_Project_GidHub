import 'package:api_project/widget/Container_Widget.dart';
import 'package:api_project/widget/Text_Widget.dart';
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
        title: Ktext(text: 'RepoView Page'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Obx(
            () => controller.webLoading.value < 1
                ? LinearProgressIndicator(
                    value: controller.webLoading.value,
                  )
                : Kcontainer(),
          ),
          Expanded(child: WebViewWidget(controller: controller.controller)),
        ],
      ),
    );
  }
}
