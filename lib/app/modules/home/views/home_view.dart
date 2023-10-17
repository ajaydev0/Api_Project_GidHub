import 'package:api_project/widget/KAppBar.dart';
import 'package:api_project/widget/SizeBox_Widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                              color: istheme.theme.value
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
                                return ListViewitem(istheme: istheme);
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
                                return GridViewItem(istheme: istheme);
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
