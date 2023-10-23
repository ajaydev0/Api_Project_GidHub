import 'package:get/get.dart';

import '../controllers/repo_view_controller.dart';

class RepoViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RepoViewController>(
      () => RepoViewController(),
    );
  }
}
