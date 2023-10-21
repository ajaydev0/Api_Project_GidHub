import 'dart:convert';
import 'package:api_project/Utils/snackBar_utils.dart';
import 'package:api_project/app/modules/models/repoModel.dart';
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
      var data1 = json.decode(dataResponse.body);

      //Name / Avatar Img
      userNameData.value = data1["login"] ?? "";
      userImgData.value = data1["avatar_url"] ?? "";
      callRepoData(userName);
    } else {
      Get.back();
      showSnackMessage(title: "Error", message: "User Not Found", seconds: 2);
    }
  }

  RxList<RepoModel> repoList = <RepoModel>[].obs;
  //Repo Data
  callRepoData(String userName) async {
    var dataResponse = await http
        .get(Uri.parse("https://api.github.com/users/$userName/repos"));

    if (dataResponse.statusCode == 200) {
      var data2 = json.decode(dataResponse.body);
      for (var element in data2) {
        repoList.add(RepoModel(
            repoName: element["name"].toString(),
            url: element["html_url"].toString(),
            repoDate: element["updated_at"].toString(),
            type: element["language"].toString()));
      }

      isLoading.value = false;
    }
  }

  RxBool isLoading = false.obs;
  RxBool listToGrid = true.obs;

  changeListToGrid() {
    listToGrid.value = !listToGrid.value;
  }
}
