import 'dart:convert';
import 'package:api_project/Utils/snackBar_utils.dart';
import 'package:api_project/app/modules/models/repoModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../const/colors.dart';
import '../../MainApp/controllers/main_app_controller.dart';
import '../views/widgets/sortItems.dart';

class HomeController extends GetxController {
  sortAtoZ() {
    repoList.sort(
      (a, b) => a.repoName.toLowerCase().compareTo(b.repoName.toLowerCase()),
    );
    repoList.refresh();
    Get.back();
  }

  sortZtoA() {
    repoList.sort(
      (a, b) => b.repoName.toLowerCase().compareTo(a.repoName.toLowerCase()),
    );
    repoList.refresh();
    Get.back();
  }

  dateOrderByCreate() {
    repoList.sort(
      (a, b) => a.createDate!.compareTo(b.createDate!),
    );
    repoList.refresh();
    Get.back();
  }

  dateOrderByUpdate() {
    repoList.sort(
      (a, b) => a.updateDate!.compareTo(b.updateDate!),
    );
    repoList.refresh();
    Get.back();
  }

  dateOrderByPush() {
    repoList.sort(
      (a, b) => a.pushDate!.compareTo(b.pushDate!),
    );
    repoList.refresh();
    Get.back();
  }

  //Sort Dialog Box
  showSortDialog() {
    final istheme = Get.put(MainAppController());
    return Get.bottomSheet(
      Container(
        height: 280,
        decoration: BoxDecoration(
            border: Border.all(
                color: istheme.theme.value ? Kcolor.black : Kcolor.white,
                width: 0.3),
            color: istheme.theme.value ? Kcolor.white : Kcolor.black,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sortItems(
                text: "Name (A-Z)",
                istheme,
                onPressed: () {
                  sortAtoZ();
                },
              ),
              sortItems(
                text: "Name (Z-A)",
                istheme,
                onPressed: () {
                  sortZtoA();
                },
              ),
              sortItems(
                text: "Date order by create",
                istheme,
                onPressed: () {
                  dateOrderByCreate();
                },
              ),
              sortItems(
                text: "Date order by update",
                istheme,
                onPressed: () {
                  dateOrderByUpdate();
                },
              ),
              sortItems(
                text: "Date order by push",
                istheme,
                onPressed: () {
                  dateOrderByPush();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  //
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
      // print(dataResponse.body);
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
          type: element["language"].toString(),
          createDate: element["created_at"].toString(),
          updateDate: element["updated_at"].toString(),
          pushDate: element["pushed_at"].toString(),
        ));
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
