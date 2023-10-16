import 'package:api_project/widget/ElevatedButton_Widget.dart';
import 'package:api_project/widget/KAppBar.dart';
import 'package:api_project/widget/SizeBox_Widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../MainApp/controllers/main_app_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    return Scaffold(
      appBar: const KAppBar(title: 'HomeView'),
      body: Obx(
        () => controller.isLoading.value
            ? Center(
                child: Material(
                  color: Get.find<MainAppController>().theme.value
                      ? Colors.grey.shade300
                      : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  elevation: 20,
                  child: SizedBox(
                    height: 250,
                    width: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        KsBox(h: 10),
                        KsBox(
                            h: 50,
                            w: 50,
                            child: const CircularProgressIndicator(
                                color: Colors.black)),
                        const Text(
                          "Loading...",
                          style: TextStyle(color: Colors.black),
                        ),
                        KeleButtonText(
                          h: 40,
                          w: 150,
                          text: "Cancel",
                          onPressed: () {
                            Get.back();
                          },
                          tColor: Get.find<MainAppController>().theme.value
                              ? Colors.black
                              : Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    KsBox(h: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CachedNetworkImage(
                          imageUrl:
                              //  "",
                              "https://images.pexels.com/photos/5218003/pexels-photo-5218003.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                          imageBuilder: (context, imageProvider) => Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) => KsBox(
                              h: 100,
                              w: 100,
                              child: const CircularProgressIndicator(
                                  color: Colors.black)),
                          errorWidget: (context, url, error) => Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.error,
                              size: 50,
                            ),
                          ),
                        ),
                        const Text(
                          "User Name",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    KsBox(h: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text("Sort"),
                        const Text("Repo List"),
                        Obx(
                          () => IconButton(
                            onPressed: () {
                              controller.changeListToGrid();
                              print(controller.listToGrid.value);
                            },
                            icon: Icon(
                              controller.listToGrid.value
                                  ? Icons.list
                                  : Icons.grid_view,
                              size: 25,
                              color: Get.find<MainAppController>().theme.value
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    KsBox(h: 20),
                    controller.listToGrid.value
                        ? SizedBox(
                            height: 800,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: 50,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, bottom: 20),
                                  child: Material(
                                    borderRadius: BorderRadius.circular(10),
                                    elevation: 5,
                                    child: Obx(
                                      () => Container(
                                        height: 80,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color:
                                                  Get.find<MainAppController>()
                                                          .theme
                                                          .value
                                                      ? Colors.black
                                                          .withOpacity(.3)
                                                      : Colors.white
                                                          .withOpacity(.3),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Get.find<MainAppController>()
                                                    .theme
                                                    .value
                                                ? Colors.white.withOpacity(.85)
                                                : Colors.black
                                                    .withOpacity(.85)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Expanded(
                                                    child: Text(
                                                      "Repositories_Name",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      softWrap: false,
                                                    ),
                                                  ),
                                                  Obx(
                                                    () => SizedBox(
                                                      height: 30,
                                                      width: 70,
                                                      child: ElevatedButton(
                                                          onPressed: () {},
                                                          child: Text(
                                                            "Public",
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              color: Get.find<
                                                                          MainAppController>()
                                                                      .theme
                                                                      .value
                                                                  ? Colors.black
                                                                  : Colors
                                                                      .white,
                                                            ),
                                                          )),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    height: 10,
                                                    width: 10,
                                                    decoration:
                                                        const BoxDecoration(
                                                            color: Colors.teal,
                                                            shape: BoxShape
                                                                .circle),
                                                  ),
                                                  KsBox(w: 5),
                                                  const Text(
                                                    "Dart",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 11),
                                                  ),
                                                ],
                                              ),
                                              KsBox(h: 2),
                                              const Text(
                                                "Date : 12-01-2022 ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 11),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : SizedBox(
                            height: 800,
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 2 / 2,
                              ),
                              itemCount: 20,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, bottom: 20),
                                  child: Material(
                                    borderRadius: BorderRadius.circular(10),
                                    elevation: 5,
                                    child: Obx(
                                      () => Container(
                                        height: 100,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color:
                                                  Get.find<MainAppController>()
                                                          .theme
                                                          .value
                                                      ? Colors.black
                                                          .withOpacity(.3)
                                                      : Colors.white
                                                          .withOpacity(.3),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Get.find<MainAppController>()
                                                    .theme
                                                    .value
                                                ? Colors.white.withOpacity(.85)
                                                : Colors.black
                                                    .withOpacity(.85)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      "Repositories_Name",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      softWrap: false,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    height: 10,
                                                    width: 10,
                                                    decoration:
                                                        const BoxDecoration(
                                                            color: Colors.teal,
                                                            shape: BoxShape
                                                                .circle),
                                                  ),
                                                  KsBox(w: 5),
                                                  const Text(
                                                    "Dart",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 11),
                                                  ),
                                                ],
                                              ),
                                              const Text(
                                                "Date : 12-01-2022 ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 11),
                                              ),
                                              Center(
                                                  child: Obx(
                                                () => SizedBox(
                                                  height: 30,
                                                  width: 70,
                                                  child: ElevatedButton(
                                                      onPressed: () {},
                                                      child: Text(
                                                        "Public",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: Get.find<
                                                                      MainAppController>()
                                                                  .theme
                                                                  .value
                                                              ? Colors.black
                                                              : Colors.white,
                                                        ),
                                                      )),
                                                ),
                                              ))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                  ],
                ),
              ),
      ),
    );
  }
}
