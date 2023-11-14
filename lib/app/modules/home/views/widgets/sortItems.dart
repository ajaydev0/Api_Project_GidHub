import 'package:api_project/const/colors.dart';
import 'package:api_project/widget/Text_Widget.dart';
import 'package:flutter/material.dart';

import '../../../MainApp/controllers/main_app_controller.dart';

TextButton sortItems(MainAppController istheme,
    {void Function()? onPressed, dynamic text}) {
  return TextButton(
    onPressed: onPressed,
    child: Row(
      children: [
        Ktext(
          text: text,
          size: 18,
          color: istheme.theme.value ? Kcolor.black : Kcolor.white,
        ),
      ],
    ),
  );
}
