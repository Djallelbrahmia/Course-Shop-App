import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/Presentation/views/sign-in/signin_controller.dart';
import 'package:shop_app/common/values/colors.dart';

Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
    padding: EdgeInsets.only(left: 25.h, right: 25.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _reusableIcons("google", context),
        _reusableIcons("facebook", context),
        _reusableIcons("apple", context)
      ],
    ),
  );
}

Widget _reusableIcons(String iconName, BuildContext context) {
  return GestureDetector(
    onTap: () {
      SignInController(context: context).handleSignIn("google");
    },
    child: SizedBox(
      width: 40.w,
      height: 40.w,
      child: Image.asset("assets/icons/${iconName}.png"),
    ),
  );
}

Widget reusbaleText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
    ),
  );
}

Widget buildTextField(String hintText, String textType, String iconName,
    void Function(String data)? func) {
  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(bottom: 16.h),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15.w),
        ),
        border: Border.all(color: AppColors.primaryFourThElementText)),
    child: Row(
      children: [
        Container(
            width: 16.w,
            height: 16.w,
            margin: EdgeInsets.only(left: 17.w),
            child: Image.asset("assets/icons/${iconName}.png")),
        Container(
          width: 200.w,
          height: 50.h,
          child: TextField(
            onChanged: func,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                hintText: hintText,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                hintStyle:
                    TextStyle(color: AppColors.primarySecondaryElementText)),
            style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.normal,
                fontSize: 14.sp),
            autocorrect: false,
            obscureText: textType == "password",
          ),
        )
      ],
    ),
  );
}

Widget buildLogInButton(String buttonName, String type, Function()? func) {
  return GestureDetector(
      onTap: func,
      child: Container(
        margin: EdgeInsets.only(
            left: 25.w, right: 25.w, top: type == "login" ? 25.h : 15.h),
        width: 325.w,
        height: 50.h,
        decoration: BoxDecoration(
            border: Border.all(
                color: type == "login"
                    ? Colors.transparent
                    : AppColors.primaryFourThElementText),
            color: type == "login"
                ? AppColors.primaryElement
                : AppColors.primaryBackground,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 1),
                  color: Colors.grey.withOpacity(0.1))
            ]),
        child: Center(
            child: Text(
          buttonName,
          style: TextStyle(
              fontSize: 16.sp,
              color: type == "login"
                  ? AppColors.primaryBackground
                  : AppColors.primaryText),
        )),
      ));
}
