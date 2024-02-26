import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/Presentation/views/application/bloc/app_bloc.dart';
import 'package:shop_app/Presentation/views/application/bloc/app_events.dart';
import 'package:shop_app/Presentation/views/application/bloc/app_states.dart';
import 'package:shop_app/common/values/colors.dart';

Widget buildPage(int index) {
  List<Widget> _widget = [
    Center(child: Text("Home")),
    Center(child: Text("Search")),
    Center(child: Text("Course")),
    Center(child: Text("Chat")),
    Center(child: Text("Profile"))
  ];
  return _widget[index];
}

Widget buildNavBar(BuildContext context, AppStates state) {
  return Container(
    width: 375.w,
    height: 58.h,
    decoration: BoxDecoration(
        color: AppColors.primaryElement,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.h), topRight: Radius.circular(20.h)),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1)
        ]),
    child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: AppColors.primaryElement,
        unselectedItemColor: AppColors.primaryFourThElementText,
        currentIndex: state.index,
        elevation: 0,
        onTap: (value) {
          context.read<AppBlocs>().add(TriggerAppEvent(value));
        },
        items: [
          BottomNavigationBarItem(
            label: "home",
            icon: SizedBox(
              width: 15.w,
              height: 15.h,
              child: Image.asset("assets/icons/home.png"),
            ),
            activeIcon: SizedBox(
              width: 15.w,
              height: 15.h,
              child: Image.asset(
                "assets/icons/home.png",
                color: AppColors.primaryElement,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: "search",
            icon: SizedBox(
              width: 15.w,
              height: 15.h,
              child: Image.asset("assets/icons/search2.png"),
            ),
            activeIcon: SizedBox(
              width: 15.w,
              height: 15.h,
              child: Image.asset(
                "assets/icons/search2.png",
                color: AppColors.primaryElement,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: "course",
            icon: SizedBox(
              width: 15.w,
              height: 15.h,
              child: Image.asset("assets/icons/play-circle1.png"),
            ),
            activeIcon: SizedBox(
              width: 15.w,
              height: 15.h,
              child: Image.asset(
                "assets/icons/play-circle1.png",
                color: AppColors.primaryElement,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: "chat",
            icon: SizedBox(
              width: 15.w,
              height: 15.h,
              child: Image.asset("assets/icons/message-circle.png"),
            ),
            activeIcon: SizedBox(
              width: 15.w,
              height: 15.h,
              child: Image.asset(
                "assets/icons/message-circle.png",
                color: AppColors.primaryElement,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: "profile",
            icon: SizedBox(
              width: 15.w,
              height: 15.h,
              child: Image.asset("assets/icons/person2.png"),
            ),
            activeIcon: SizedBox(
              width: 15.w,
              height: 15.h,
              child: Image.asset(
                "assets/icons/person2.png",
                color: AppColors.primaryElement,
              ),
            ),
          ),
        ]),
  );
}
