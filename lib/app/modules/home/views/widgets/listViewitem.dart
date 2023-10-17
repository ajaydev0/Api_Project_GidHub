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
          () => Container(
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
                          controller.data[index]["full_name"],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          overflow: TextOverflow.ellipsis,
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
                      const Text(
                        "Dart",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 11),
                      ),
                    ],
                  ),
                  KsBox(h: 2),
                  const Text(
                    "Date : 12-01-2022 ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
