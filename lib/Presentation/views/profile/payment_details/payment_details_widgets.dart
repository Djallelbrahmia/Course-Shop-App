import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/Presentation/views/profile/payment_details/cubit/payment_details_states.dart';
import 'package:shop_app/common/routes/routes.dart';
import 'package:shop_app/common/values/colors.dart';
import 'package:shop_app/common/values/constants.dart';
import 'package:shop_app/common/widgets/base_text_widget.dart';
import 'package:shop_app/common/widgets/list_container.dart';

Widget paymentDetailstitle() {
  return Container(
      width: 332.w,
      margin: EdgeInsets.only(top: 15.h, bottom: 8.h),
      child: reusableSubtitleText("Your payment details", fontSize: 14.sp));
}

Widget buildListPaymentDetailstItem(HistoryPaymentDetailsStates state) {
  return SingleChildScrollView(
    child: ListView.builder(
        shrinkWrap: true,
        itemCount: state.courseItems?.length,
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
                    arguments: {"id": state.courseItems?[index].id});
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
                                "${AppConstants.SERVER_UPLOADS}${state.courseItems?[index].thumbnail}"))),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      listContainer(state.courseItems?[index].name ?? ""),
                      listContainer(
                          "${state.courseItems?[index].lesson_num} lessons",
                          fontSize: 10,
                          color: AppColors.primaryThirdElementText,
                          fontWeight: FontWeight.normal)
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 55.w,
                        child: Text(
                          "${state.courseItems?[index].price}\$",
                          maxLines: 1,
                          style: const TextStyle(
                              color: AppColors.primaryText,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 55.w,
                        child: Text(
                          state.courseItems?[index].status == 1
                              ? "Success"
                              : "Failed",
                          maxLines: 1,
                          style: TextStyle(
                              color: state.courseItems?[index].status == 1
                                  ? AppColors.primaryText
                                  : Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
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
