import 'package:api_project/app/modules/MainApp/controllers/main_app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KAppBar extends StatelessWidget implements PreferredSizeWidget {
  const KAppBar({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainAppController());
    return AppBar(
      // backgroundColor: Colors.black12,
      leading: null,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          IconButton(
              onPressed: () {
                controller.changeTheme();
              },
              icon: Obx(() => controller.theme.value == true
                  ? const Icon(Icons.light_mode)
                  : const Icon(Icons.dark_mode)))
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
