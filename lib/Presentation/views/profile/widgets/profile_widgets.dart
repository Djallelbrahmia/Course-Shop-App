import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/Presentation/views/profile/bloc/profile_state.dart';
import 'package:shop_app/common/routes/routes.dart';
import 'package:shop_app/common/values/colors.dart';
import 'package:shop_app/common/widgets/base_text_widget.dart';

AppBar builProfileAppBar() {
  return AppBar(
    title: Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 18.w,
          height: 12.h,
          child: Image.asset("assets/icons/menu.png"),
        ),
        reusableSubtitleText("Profile"),
        SizedBox(
          width: 24.w,
          height: 24.h,
          child: Image.asset("assets/icons/more-vertical.png"),
        ),
      ],
    )),
  );
}

Widget profilButtonAndEditButton() {
  return Container(
    alignment: Alignment.bottomRight,
    padding: EdgeInsets.only(right: 6.w),
    width: 80.w,
    height: 80.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.h),
      image: const DecorationImage(
        image: AssetImage("assets/icons/headpic.png"),
      ),
    ),
    child: Image(
        width: 25.w,
        height: 25.h,
        image: AssetImage("assets/icons/edit_3.png")),
  );
}

var imageInfo = <String, String>{
  "Settings": "settings.png",
  "Payment details": "credit-card.png",
  "Achivements": "award.png",
  "Love": "heart(1).png",
  "Reminders": "cube.png",
};
Widget buildListView(BuildContext context) {
  return Column(
    children: [
      ...List.generate(
          imageInfo.length,
          (index) => GestureDetector(
                onTap: () {
                  if (index == 0) {
                    Navigator.of(context).pushNamed(AppRoutes.SETTINGS);
                  }
                  if (index == 1) {
                    Navigator.of(context).pushNamed(AppRoutes.PAYMENT_DETAILS);
                  }
                },
                child: Container(
                    margin: EdgeInsets.only(bottom: 15.h),
                    child: Row(
                      children: [
                        Container(
                          width: 40.w,
                          height: 40.h,
                          padding: const EdgeInsets.all(7.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.w),
                              color: AppColors.primaryElement),
                          child: Image.asset(
                              "assets/icons/${imageInfo.values.elementAt(index)}"),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          imageInfo.keys.elementAt(index),
                          style: TextStyle(
                              color: AppColors.primaryText,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
              ))
    ],
  );
}

Widget buildRowView(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 20.h, bottom: 20.h, left: 25.w, right: 25.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _rowView("profile_video.png", "My Courses", () {
          Navigator.of(context).pushNamed(AppRoutes.MY_COURSES);
        }),
        _rowView("profile_book.png", "Buy Courses", () {
          Navigator.of(context).pushNamed(AppRoutes.BUY_COURSES);
        }),
        _rowView("profile_star.png", "4.9", () {})
      ],
    ),
  );
}

Widget _rowView(String img, String text, void Function()? fn) {
  return GestureDetector(
    onTap: fn,
    child: Container(
      width: 100.w,
      padding: EdgeInsets.only(top: 7.h, bottom: 7.h),
      decoration: BoxDecoration(
          color: AppColors.primaryElement,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 3,
                offset: const Offset(0, 3)),
          ],
          borderRadius: BorderRadius.circular(15.w),
          border: Border.all(color: AppColors.primaryElement)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 20.w,
            height: 20.h,
            child: Image.asset("assets/icons/$img"),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.h),
            child: reusableSubtitleText(text,
                color: AppColors.primaryElementText,
                fontSize: 11.sp,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
  );
}

Widget buildProfileName(ProfileStates state) {
  return state.userProfile == null
      ? Container()
      : Container(
          padding: EdgeInsets.only(left: 50.w, right: 50.w),
          margin: EdgeInsets.only(bottom: 10.h, top: 5.h),
          child: Text(
            state.userProfile?.name ?? "No name given",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.primarySecondaryElementText, fontSize: 12.sp),
          ));
}
