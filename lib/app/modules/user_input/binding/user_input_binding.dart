import 'package:get/get.dart';
import '../controller/user_input_controller.dart';

class UserInputBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserInputController>(() => UserInputController());
  }
}
