import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/Presentation/views/profile/buy_courses/bloc/buy_courses_states.dart';
import 'package:shop_app/common/routes/routes.dart';
import 'package:shop_app/common/values/colors.dart';
import 'package:shop_app/common/values/constants.dart';
import 'package:shop_app/common/widgets/base_text_widget.dart';
import 'package:shop_app/common/widgets/list_container.dart';

Widget courseBoughtTitle() {
  return Container(
      width: 332.w,
      margin: EdgeInsets.only(top: 15.h, bottom: 8.h),
      child: reusableSubtitleText("The Courses you bought", fontSize: 14.sp));
}

Widget buildBoughtListItem(LoadedBuyCoursesStates states) {
  return SingleChildScrollView(
    child: ListView.builder(
        shrinkWrap: true,
        itemCount: states.courseItem.length,
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
                Navigator.of(context).pushNamed(AppRoutes.COURSE_DETAILS,
                    arguments: {"id": states.courseItem[index].id});
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
                                "${AppConstants.SERVER_UPLOADS}${states.courseItem[index].thumbnail}"))),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      listContainer(states.courseItem[index].name ?? ""),
                      listContainer(
                          "${states.courseItem[index].lesson_num} lessons",
                          fontSize: 10,
                          color: AppColors.primaryThirdElementText,
                          fontWeight: FontWeight.normal)
                    ],
                  ),
                  SizedBox(
                    width: 55.w,
                    child: Text(
                      "${states.courseItem[index].price}\$",
                      maxLines: 1,
                      style: const TextStyle(
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                  // Container(
                  //   width: 55.w,
                  //   child: Image(
                  //       width: 24.w,
                  //       height: 24.h,
                  //       image: AssetImage("assets/icons/arrow_right.png")),
                  // ),
                ],
              ),
            ),
          );
        }),
  );
}
