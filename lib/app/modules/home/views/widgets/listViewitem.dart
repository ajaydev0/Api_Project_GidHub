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
  final index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 5,
        child: Obx(
          () => GestureDetector(
            onTap: () {
              print(controller.repoList[index].url);
            },
            child: Container(
              height: 80,
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
                                        borderRadius:
                                            BorderRadius.circular(5))),
                                onPressed: () {
                                  print(controller.repoList[index].url);
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
                        )
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 11),
                        ),
                      ],
                    ),
                    KsBox(h: 2),
                    Text(
                      controller.repoList[index].repoDate.substring(0, 10),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                    )
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
