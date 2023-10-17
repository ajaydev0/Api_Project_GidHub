import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  dynamic userName;
  @override
  void onInit() {
    isLoading.value = true;
    userName = Get.arguments;
    callUserData(userName);
    super.onInit();
  }

  RxString userNameData = "".obs;
  RxString userImgData = "".obs;
  //User Data
  callUserData(String userName) async {
    var dataResponse =
        await http.get(Uri.parse("https://api.github.com/users/$userName"));

    if (dataResponse.statusCode == 200) {
      var data = json.decode(dataResponse.body);
      userNameData.value = data["login"] ?? "";
      userImgData.value = data["avatar_url"] ?? "";
      print(userNameData.value);
      print(userImgData.value);
      callRepoData(userName);
    } else {
      Get.back();
      Get.snackbar("Error", "User Not Found");
    }
  }

  dynamic data;

  //Repo Data
  callRepoData(String userName) async {
    var dataResponse = await http
        .get(Uri.parse("https://api.github.com/users/$userName/repos"));

    if (dataResponse.statusCode == 200) {
      data = json.decode(dataResponse.body);

      // userNameData.value = data["login"] ?? "";
      // userImgData.value = data["avatar_url"] ?? "";
      //
      // Repo List
      // repoList = [data].obs;
      // print(data[0]["full_name"]);
      // print(data["full_name"]);
      isLoading.value = false;
    }
  }

  RxBool isLoading = false.obs;

  RxBool listToGrid = true.obs;

  changeListToGrid() {
    listToGrid.value = !listToGrid.value;
  }
}
