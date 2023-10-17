import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        color: istheme.theme.value ? Colors.grey.shade300 : Colors.white,
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
                  child: const CircularProgressIndicator(color: Colors.black)),
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
                tColor: istheme.theme.value ? Colors.black : Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
