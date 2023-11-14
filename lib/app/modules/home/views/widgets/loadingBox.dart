import 'package:api_project/widget/Text_Widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../const/colors.dart';
import '../../../../../widget/ElevatedButton_Widget.dart';
import '../../../../../widget/SizeBox_Widget.dart';
import '../../../MainApp/controllers/main_app_controller.dart';

class LoadingBox extends StatelessWidget {
  const LoadingBox({
    super.key,
    required this.istheme,
  });

  final MainAppController istheme;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: istheme.theme.value ? Colors.grey.shade300 : Kcolor.white,
        borderRadius: BorderRadius.circular(10),
        elevation: 20,
        child: KsBox(
          h: 250,
          w: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              KsBox(h: 10),
              KsBox(
                  h: 50,
                  w: 50,
                  child: CircularProgressIndicator(color: Kcolor.black)),
              Ktext(text: "Loading...", color: Kcolor.black),
              KeleButtonText(
                h: 40,
                w: 150,
                text: "Cancel",
                onPressed: () {
                  Get.back();
                },
                tColor: istheme.theme.value ? Kcolor.black : Kcolor.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
