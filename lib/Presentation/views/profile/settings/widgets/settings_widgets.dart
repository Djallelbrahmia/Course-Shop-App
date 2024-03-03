import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/common/values/colors.dart';
import 'package:shop_app/common/widgets/base_text_widget.dart';

AppBar buildSettingAppBar() {
  return AppBar(title: reusableSubtitleText("Settings"));
}

Widget settingsButton(BuildContext context, void Function() func) {
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Confirm logout"),
                content: Text("Confirm logout"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Cancel")),
                  TextButton(onPressed: func, child: const Text("Confirm"))
                ],
              ));
    },
    child: Container(
      height: 100.w,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: AssetImage("assets/icons/Logout.png"))),
    ),
  );
}
