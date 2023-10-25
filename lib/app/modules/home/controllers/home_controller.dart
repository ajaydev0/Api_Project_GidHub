import 'dart:convert';
import 'package:api_project/Utils/snackBar_utils.dart';
import 'package:api_project/app/modules/models/repoModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../MainApp/controllers/main_app_controller.dart';

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
            color: istheme.theme.value ? Colors.white : Colors.black,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  sortAtoZ();
                },
                child: Row(
                  children: [
                    Text(
                      "Name (A-Z)",
                      style: TextStyle(
                        fontSize: 18,
                        color:
                            istheme.theme.value ? Colors.black : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  sortZtoA();
                },
                child: Row(
                  children: [
                    Text(
                      "Name (Z-A)",
                      style: TextStyle(
                        fontSize: 18,
                        color:
                            istheme.theme.value ? Colors.black : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {
                    dateOrderByCreate();
                  },
                  child: Row(
                    children: [
                      Text(
                        "Date order by create",
                        style: TextStyle(
                          fontSize: 18,
                          color:
                              istheme.theme.value ? Colors.black : Colors.white,
                        ),
                      ),
                    ],
                  )),
              TextButton(
                  onPressed: () {
                    dateOrderByUpdate();
                  },
                  child: Row(
                    children: [
                      Text(
                        "Date order by update",
                        style: TextStyle(
                          fontSize: 18,
                          color:
                              istheme.theme.value ? Colors.black : Colors.white,
                        ),
                      ),
                    ],
                  )),
              TextButton(
                  onPressed: () {
                    dateOrderByPush();
                  },
                  child: Row(
                    children: [
                      Text(
                        "Date order by push",
                        style: TextStyle(
                          fontSize: 18,
                          color:
                              istheme.theme.value ? Colors.black : Colors.white,
                        ),
                      ),
                    ],
                  )),
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
