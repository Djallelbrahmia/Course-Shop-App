import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/common/values/colors.dart';

AppBar buildAppBar(String type) {
  return AppBar(
    bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: AppColors.primarySecondaryBackground,
          height: 1,
        )),
    elevation: 0,
    title: Text(
      type,
      style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal),
    ),
  );
}
