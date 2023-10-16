import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;

  RxBool listToGrid = true.obs;

  changeListToGrid() {
    listToGrid.value = !listToGrid.value;
  }
}
