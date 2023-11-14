import 'package:api_project/app/router/app_pages.dart';
import 'package:api_project/const/colors.dart';
import 'package:api_project/widget/Container_Widget.dart';
import 'package:api_project/widget/Text_Widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../widget/SizeBox_Widget.dart';
import '../../../MainApp/controllers/main_app_controller.dart';
import '../../controllers/home_controller.dart';

class ListViewitem extends StatelessWidget {
  const ListViewitem({
    super.key,
    required this.istheme,
    required this.controller,
    required this.index,
  });
  final MainAppController istheme;
  final HomeController controller;
  final dynamic index;

  @override
  Widget build(BuildContext context) {
    String url = controller.repoList[index].url;
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 5,
        child: Obx(
          () => GestureDetector(
            onTap: () {
              Get.toNamed(Routes.repoView, arguments: url);
            },
            child: Kcontainer(
              h: 80,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: istheme.theme.value
                        ? Kcolor.black.withOpacity(.3)
                        : Kcolor.white.withOpacity(.3),
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: istheme.theme.value
                      ? Kcolor.white.withOpacity(.85)
                      : Kcolor.black.withOpacity(.85)),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            controller.repoList[index].repoName,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            softWrap: false,
                          ),
                        ),
                        Obx(
                          () => Kcontainer(
                            h: 30,
                            w: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: istheme.theme.value
                                    ? Kcolor.black.withOpacity(.3)
                                    : Kcolor.white.withOpacity(.3),
                              ),
                            ),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5))),
                                onPressed: () {
                                  Get.toNamed(Routes.repoView, arguments: url);
                                },
                                child: Ktext(
                                    text: "Public",
                                    size: 12,
                                    color: istheme.theme.value
                                        ? Kcolor.black
                                        : Kcolor.white)),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Kcontainer(
                          h: 10,
                          w: 10,
                          decoration: const BoxDecoration(
                              color: Colors.teal, shape: BoxShape.circle),
                        ),
                        KsBox(w: 5),
                        Ktext(
                            text: controller.repoList[index].type,
                            weight: FontWeight.bold,
                            size: 11),
                      ],
                    ),
                    KsBox(h: 2),
                    Ktext(
                        text: controller.repoList[index].updateDate!
                            .substring(0, 10),
                        weight: FontWeight.bold,
                        size: 11)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
