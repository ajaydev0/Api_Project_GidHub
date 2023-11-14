import 'package:api_project/widget/Container_Widget.dart';
import 'package:api_project/widget/KAppBar.dart';
import 'package:api_project/widget/SizeBox_Widget.dart';
import 'package:api_project/widget/Text_Widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../const/colors.dart';
import '../../MainApp/controllers/main_app_controller.dart';
import '../controllers/home_controller.dart';
import 'widgets/GridViewItem.dart';
import 'widgets/listViewitem.dart';
import 'widgets/loadingBox.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    final istheme = Get.put(MainAppController());
    return Scaffold(
      appBar: const KAppBar(title: 'HomeView'),
      body: Obx(
        () => controller.isLoading.value
            ? LoadingBox(istheme: istheme)
            : SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    KsBox(h: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CachedNetworkImage(
                          imageUrl: controller.userImgData.value,
                          imageBuilder: (context, imageProvider) => Kcontainer(
                            h: 150,
                            w: 150,
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
                              child: CircularProgressIndicator(
                                  color: Kcolor.black)),
                          errorWidget: (context, url, error) => Kcontainer(
                            h: 150,
                            w: 150,
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
                        Ktext(
                            text: controller.userNameData.value,
                            weight: FontWeight.bold),
                      ],
                    ),
                    KsBox(h: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () {
                            controller.showSortDialog();
                          },
                          child: Ktext(
                              text: "Sort ▼",
                              color: istheme.theme.value
                                  ? Kcolor.black
                                  : Kcolor.white),
                        ),
                        Ktext(
                            text:
                                "Repositories (${controller.repoList.length.toInt()})"),
                        Obx(
                          () => IconButton(
                            onPressed: () {
                              controller.changeListToGrid();
                            },
                            icon: Icon(
                              controller.listToGrid.value
                                  ? Icons.list
                                  : Icons.grid_view,
                              size: 25,
                              color: istheme.theme.value
                                  ? Kcolor.black
                                  : Kcolor.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    KsBox(h: 20),
                    controller.listToGrid.value
                        ? KsBox(
                            h: 100 * controller.repoList.length.toDouble(),
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: controller.repoList.length,
                              itemBuilder: (context, index) {
                                return ListViewitem(
                                    istheme: istheme,
                                    controller: controller,
                                    index: index);
                              },
                            ),
                          )
                        : KsBox(
                            //Even / Odd Logic
                            h: controller.repoList.length.toInt().isEven
                                ? 180 * controller.repoList.length / 2
                                : 108 * controller.repoList.length.toDouble(),
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 2 / 2,
                              ),
                              itemCount: controller.repoList.length,
                              itemBuilder: (context, index) {
                                return GridViewItem(
                                    istheme: istheme,
                                    controller: controller,
                                    index: index);
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
