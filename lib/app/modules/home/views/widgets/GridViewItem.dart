import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../widget/SizeBox_Widget.dart';
import '../../../../router/app_pages.dart';
import '../../../MainApp/controllers/main_app_controller.dart';
import '../../controllers/home_controller.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({
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
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Material(
          borderRadius: BorderRadius.circular(10),
          elevation: 5,
          child: GestureDetector(
            onTap: () {
              Get.toNamed(Routes.repoView, arguments: url);
            },
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: istheme.theme.value
                        ? Colors.black.withOpacity(.3)
                        : Colors.white.withOpacity(.3),
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: istheme.theme.value
                      ? Colors.white.withOpacity(.85)
                      : Colors.black.withOpacity(.85)),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: const BoxDecoration(
                              color: Colors.teal, shape: BoxShape.circle),
                        ),
                        KsBox(w: 5),
                        Text(
                          controller.repoList[index].type,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 11),
                        ),
                      ],
                    ),
                    Text(
                      controller.repoList[index].updateDate!.substring(0, 10),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 11),
                    ),
                    Center(
                        child: Obx(
                      () => Container(
                        height: 30,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: istheme.theme.value
                                ? Colors.black.withOpacity(.3)
                                : Colors.white.withOpacity(.3),
                          ),
                        ),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            onPressed: () {
                              Get.toNamed(Routes.repoView, arguments: url);
                            },
                            child: Text(
                              "Public",
                              style: TextStyle(
                                fontSize: 12,
                                color: istheme.theme.value
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
      ),
    );
  }
}
