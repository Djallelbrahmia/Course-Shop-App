import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/Presentation/views/common_widgets.dart';
import 'package:shop_app/common/values/colors.dart';
import 'package:shop_app/common/widgets/base_text_widget.dart';

AppBar buildCourseDetailsAppBar() {
  return AppBar(
    title: reusableSubtitleText("Course Detail"),
  );
}

Widget thumbNail() {
  return Container(
    width: 325.w,
    height: 200.h,
    decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/icons/Image(1).png"))),
  );
}

Widget menuViewCourseDetails() {
  return Container(
    width: 325.w,
    child: Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.circular(7.w),
                border: Border.all(color: AppColors.primaryElement)),
            child: Text(
              "Author Page",
              style: TextStyle(
                  color: AppColors.primaryElementText,
                  fontWeight: FontWeight.normal,
                  fontSize: 10.sp),
            ),
          ),
        ),
        _iconAndNum("assets/icons/people.png", 0),
        _iconAndNum("assets/icons/star.png", 0)
      ],
    ),
  );
}

Widget _iconAndNum(String iconName, int num) {
  return Container(
    margin: EdgeInsets.only(left: 30.w),
    child: Row(
      children: [
        Image(
          width: 20.w,
          height: 20.h,
          image: AssetImage(iconName),
        ),
        reusableSubtitleText(
          num.toString(),
          color: AppColors.primaryThirdElementText,
          fontSize: 11.sp,
          fontWeight: FontWeight.normal,
        )
      ],
    ),
  );
}

Widget courseLessonList() {
  return Container(
    width: 325.w,
    height: 80.h,
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.w),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 1)),
        ]),
    child: InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 60.w,
            height: 60.h,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/icons/Image(1).png"))),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _listContainer(),
              _listContainer(
                  fontSize: 10,
                  color: AppColors.primaryThirdElementText,
                  fontWeight: FontWeight.normal)
            ],
          ),
          Container(
            child: Image(
                width: 24.w,
                height: 24.h,
                image: AssetImage("assets/icons/arrow_right.png")),
          )
        ],
      ),
    ),
  );
}

Widget _listContainer(
    {double fontSize = 13,
    Color color = AppColors.primaryText,
    FontWeight fontWeight = FontWeight.bold}) {
  return Container(
    margin: EdgeInsets.only(left: 6.w),
    width: 200.w,
    child: Text(
      "UI Design",
      overflow: TextOverflow.clip,
      maxLines: 1,
      style: TextStyle(
          color: color, fontSize: fontSize.sp, fontWeight: fontWeight),
    ),
  );
}

Widget courseSummaryTitle() {
  return reusableSubtitleText('The course includes', fontSize: 14.sp);
}

var imageInfo = <String, String>{
  "36 Hours Video": "video_detail.png",
  "Total 30 Lessons": "file_detail.png",
  "67 Downloadable Ressources": "download_detail.png",
};
Widget courseSummaryView(BuildContext context) {
  return Column(
    children: [
      ...List.generate(
          imageInfo.length,
          (index) => GestureDetector(
                onTap: () {},
                child: Container(
                    margin: EdgeInsets.only(top: 15.h),
                    child: Row(
                      children: [
                        Container(
                          // padding: const EdgeInsets.all(7.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.w),
                              color: AppColors.primaryElement),
                          child: Image.asset(
                              width: 30.w,
                              height: 30.h,
                              "assets/icons/${imageInfo.values.elementAt(index)}"),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          imageInfo.keys.elementAt(index),
                          style: TextStyle(
                              color: AppColors.primarySecondaryElementText,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
              ))
    ],
  );
}

Widget descriptionText(String text) {
  return reusableSubtitleText(text,
      color: AppColors.primaryThirdElementText,
      fontWeight: FontWeight.normal,
      fontSize: 11.sp);
}

Widget goBuyButton(String name) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10.h),
    width: 330.w,
    height: 50.h,
    decoration: BoxDecoration(
        color: AppColors.primaryElement,
        borderRadius: BorderRadius.all(
          Radius.circular(10.w),
        ),
        border: Border.all(color: AppColors.primaryElement)),
    child: Text(
      name,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: AppColors.primaryElementText,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal),
    ),
  );
}
