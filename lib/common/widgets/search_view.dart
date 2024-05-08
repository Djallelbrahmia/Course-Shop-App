import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/common/values/colors.dart';

Widget searchView(String hintext) {
  return Row(
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
            color: AppColors.primaryBackground,
            borderRadius: BorderRadius.circular(15.h),
            border: Border.all(color: AppColors.primaryFourThElementText)),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17.w),
              width: 16.h,
              height: 16.w,
              child: Image.asset("assets/icons/search.png"),
            ),
            Container(
              width: 240.w,
              height: 40.h,
              child: TextField(
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
                    hintText: hintext,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    hintStyle: const TextStyle(
                        color: AppColors.primarySecondaryElementText)),
                style: TextStyle(
                    color: AppColors.primaryText,
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.normal,
                    fontSize: 14.sp),
                autocorrect: false,
              ),
            )
          ],
        ),
      ),
      SizedBox(
        width: 4.w,
      ),
      GestureDetector(
        onTap: () {},
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.circular(13.w),
              border: Border.all(color: AppColors.primaryElement)),
          child: Image.asset(
            "assets/icons/options.png",
          ),
        ),
      )
    ],
  );
}
