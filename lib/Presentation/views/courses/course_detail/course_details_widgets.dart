import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/Presentation/views/courses/course_detail/bloc/course_d_states.dart';
import 'package:shop_app/common/routes/routes.dart';
import 'package:shop_app/common/values/colors.dart';
import 'package:shop_app/common/values/constants.dart';
import 'package:shop_app/common/widgets/base_text_widget.dart';
import 'package:shop_app/common/widgets/list_container.dart';

AppBar buildCourseDetailsAppBar() {
  return AppBar(
    title: reusableSubtitleText("Course Detail"),
  );
}

Widget thumbNail({img}) {
  return Container(
    width: 325.w,
    height: 200.h,
    decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage('${AppConstants.SERVER_UPLOADS}$img'))),
  );
}

Widget menuViewCourseDetails({
  int nOfPeople = 0,
  int nOfReview = 0,
}) {
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
        _iconAndNum("assets/icons/people.png", nOfPeople),
        _iconAndNum("assets/icons/star.png", nOfReview)
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

Widget courseLessonList(CourseDetailsStates states) {
  return SingleChildScrollView(
    child: ListView.builder(
        shrinkWrap: true,
        itemCount: states.lessonItems.length,
        itemBuilder: (context, index) {
          return Container(
            width: 325.w,
            height: 80.h,
            margin: EdgeInsets.only(top: 10.h),
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
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.LESSONS_DETAILS,
                    arguments: {"id": states.lessonItems[index].id});
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 60.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: NetworkImage(
                                states.lessonItems[index].thumbnail ?? ""))),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      listContainer(states.lessonItems[index].name ?? ""),
                      listContainer(states.lessonItems[index].description ?? "",
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
        }),
  );
}

Widget courseSummaryTitle() {
  return reusableSubtitleText('The course includes', fontSize: 14.sp);
}

Widget courseSummaryView(BuildContext context,
    {required int vLength, required int nLesson, required int dRessources}) {
  var imageInfo = <String, String>{
    "$vLength Hours Video": "video_detail.png",
    "Total $nLesson Lessons": "file_detail.png",
    "$nLesson Downloadable Ressources": "download_detail.png",
  };
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
